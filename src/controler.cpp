#include <cstdio>
#include <cassert>
#include <cmath>
#include <cfloat>
#include <cstring>
#include <cstdlib>
#include <map>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <vector>
#include "mpi.h"
#include "space_divider.h"
#include "structure.h"
#include "bandit.h"
#include "space_partition.h"
#include "msg_passing.h"

using namespace std;

bool sortfunction(pair<int,float> p1, pair<int,float> p2) {return p1.second > p2.second;}
bool stop_partition(int iter,int,int);

void taskAssign_cyclic(int pull_arms,map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> space_buffer, vector<pair<int,float> >reward, int pnum, int iter);

void taskAssign(map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> space_buffer, vector<pair<int,float> >reward, map<int,vector<Result*> > points, int pnum, int iter);


int main(int argc, char** argv){

  if(argc < 2) {
    cerr<<"Usage: ./master <vtr|vivado|other> [-space <space_definition_file>]";
    exit(EXIT_FAILURE);
  }
  enum app{vtr,vivado,other};
  app myApp = other;
  printf("Start DATuner...\n");

  /******** parse parameters ***********/
  bool share_best = true;
  string space_definition_file = "";
  for(int i = 0; i < argc; i++) {
    if(string(argv[i]).find("vtr") != string::npos) {
      myApp = vtr;
      space_definition_file = "./vtr_space.txt";
    }
    if(string(argv[i]).find("vivado") != string::npos) {
      myApp = vivado;
      space_definition_file = "./vivado_space.txt";
    }
    if(string(argv[i]) == "-space") {
      assert(i < argc-1);
      space_definition_file = string(argv[i+1]);
    }
  }

  /********generate solution space************/
  Space* orgSpace = NULL;
  genOrgSpace(orgSpace,space_definition_file);
  assert(orgSpace);

  map<string,string> name2type;
  {
    for(int i = 0; i < orgSpace->params.size(); i++) {
      Param* param = orgSpace->params[i];
      name2type.insert(pair<string,string>(param->name,param->type));
    }
  }

  map<int,Space*> space_buffer;
  initDivision(orgSpace,space_buffer);
  assert(space_buffer.size() != 0);

  Bandit* auc_bandit = new Bandit(space_buffer.size());
  assert(auc_bandit);
  auc_bandit->check_arms(space_buffer);
  int last_space_id = space_buffer.size();//index startting from one;

  /*********MPI*********/
  int myrank;
  int pnum;
  int len;
  char hostname[MPI_MAX_PROCESSOR_NAME];
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
  MPI_Comm_size(MPI_COMM_WORLD,&pnum);
  MPI_Get_processor_name(hostname,&len);

  int tune_type;
  if(myApp == vtr) tune_type = 1;
  else if(myApp ==vivado) tune_type = 2;
  else tune_type = 3;
  for(int i = 1; i < pnum; i++) MPI_Send(&tune_type, 1,MPI_INT,i,0,MPI_COMM_WORLD);

  /********database to save results**********/
  map<int,vector<Result*> > points; //space2results 
  map<int,Result*> space2best; //the best points in each subspace
  
  /********searching**************/
  int round = 30; //total #iterations
  int iter = 1; //iteration counter
  int cond = 0; //condition flag: indicates whether stop or not 
  int limit = 10; //#steps per iteration
  Result* gbest_result = NULL;

  while(iter < round) {
    cond = 1;
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);
    }
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&limit,1,MPI_INT,i,0,MPI_COMM_WORLD);
    }

    //calculate bandit score
    vector<pair<int,float> > reward;
    auc_bandit->cal_rewards(points,reward);
    sort(reward.begin(), reward.end(), sortfunction);
    
    //task assignment
    taskAssign(name2type, space2best,share_best,space_buffer, reward, points, pnum, iter);

    //get samples
    map<int,float> spaceid2result;
    for(int i = 1; i < pnum; i++) {
      vector<Result*> result_buf;
      Recv_MultiResult(result_buf,i);
      assert(result_buf.size() != 0);
      for(int j = 0; j < result_buf.size(); j++) {
        Result* result = result_buf[j];
        assert(result != NULL);
        if(!gbest_result) gbest_result = result;
        else {
          if(result->score < gbest_result->score) gbest_result = result;
        }
        if(points.count(result->id) > 0) {
          points.find(result->id)->second.push_back(result);
          assert(space2best.count(result->id) > 0);
          if(space2best.find(result->id)->second->score > result->score) space2best[result->id] = result;
        }
        else {
          vector<Result*> tmp_results;
          tmp_results.push_back(result);
          points.insert(pair<int,vector<Result*> >(result->id,tmp_results));
          assert(space2best.count(result->id) <= 0);
          space2best.insert(pair<int,Result*>(result->id,result));
        }
        if(spaceid2result.count(result->id) > 0) {
          spaceid2result.find(result->id)->second = spaceid2result.find(result->id)->second > result->score ? result->score : spaceid2result.find(result->id)->second;
        }
        else {
          spaceid2result.insert(pair<int,float>(result->id,result->score));
        }
      }
    }
    
    //update bandit
    for(map<int,float>::iterator im = spaceid2result.begin(); im != spaceid2result.end(); im++) auc_bandit->on_result(im->first,im->second);

    //check space division
    if(!stop_partition(iter,space_buffer.size(),pnum-1)) {
      int remove_id;
      int add_num;
      divide_space(last_space_id, orgSpace, points, space2best, space_buffer,remove_id,add_num);
      if(add_num > 0) auc_bandit->update_bandit(remove_id,add_num);
      auc_bandit->check_arms(space_buffer);
      last_space_id += add_num;
    }
    
    //output
    printf("Iter%d\n",iter);
    printf("  #subspaces: %d\n", space_buffer.size());
    printf("  best QoR: %f\n", gbest_result->score);
    printf("  best cfg: ");
    for(int ti = 0; ti < gbest_result->name2choice.size(); ti++) {
      printf("%s : %s ",gbest_result->name2choice[ti].first.c_str(), 
          gbest_result->name2choice[ti].second.c_str());
    }
    printf("\n");
    iter++;
  }

  //output searching points
  cond = 0;
  for(int i = 1; i < pnum; i++)
    MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);
  MPI_Finalize();
  return 0;
}

bool stop_partition(int iter, int size, int processNum) {
  if(iter < 15 || size < 3*processNum) return false;
  else return true;
}

void taskAssign(map<string, string> name2type, map<int, Result*> space2best, bool share_best,map<int, Space*> spaceBuf, vector<pair<int,float> >reward, map<int, vector<Result*> >points, int pnum, int iter) {
  int pull_arms = 1;
  pull_arms = pull_arms > (pnum-1)/2 ? pull_arms :(pnum-1)/2;
  int real_num = pull_arms < spaceBuf.size() ? pull_arms : spaceBuf.size();
  int last_pnum = 0;
  bool flag = true;
  for(int i = 0; i < real_num; i++) {
    int space_id = reward[i].first;
    if(points.count(space_id) <= 0) {
      flag = false;
      break;
    }
  }
  if(!flag) {
    taskAssign_cyclic(real_num,name2type, space2best,share_best,spaceBuf,reward,pnum,iter);
    return;
  }

  for(int i = 0; i < real_num; i++) {
    int space_id = reward[i].first;
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);

    fstream ftr;
    char name[500];
    sprintf(name,"StartPointSpace%d.json",last_pnum+1);
    remove(name);
    if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",
        space_id);
    if(space2best.count(space_id) > 0) {
      ftr.open(name,fstream::out);
      ftr<<"{";
      for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++)
      {
        ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
        string type = name2type[space2best[space_id]->name2choice[t_i].first];
        if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].
          second<<"\"";
        else ftr<<space2best[space_id]->name2choice[t_i].second;
        if(t_i!=space2best[space_id]->name2choice.size()-1) ftr<<", ";
      }
      ftr<<"}";
      ftr.close();
    }
    Task* task = new Task(space,5);
    assert(task != NULL);
    Send_Task(task,last_pnum+1);
    last_pnum++;
    printf("Iter: %d, Send task: Space %d => Pnum %d\n",iter,space_id,last_pnum);
  }
  if(last_pnum == pnum-1) return;

  vector<pair<int,float> > ratio;
  float worst_score = -DBL_MAX; //minimization optimization
  for(int i = 0; i < real_num; i++) {
    int space_id = reward[i].first;
    assert(points.count(space_id) > 0);
    vector<Result*> results = points.find(space_id)->second;
    float avg = 0;
    for(int j = 0; j < results.size(); j++) {
      float score = results[j]->score;
      if(fabs(score) != 10000) avg += score;
    }
    avg = avg/float(results.size());
    pair<int,float> tmp_pair = make_pair(space_id,avg);
    ratio.push_back(tmp_pair);
    if(worst_score < avg) worst_score = avg;
  }
  if(worst_score == 0.0) {
    for(int i = 0; i < ratio.size(); i++) {
      ratio[i].second += 0.1;
    }
    worst_score+=0.1;
  }
  float total_unit = 0;
  for(int i = 0; i < ratio.size(); i++) {
    float score = fabs(worst_score - ratio[i].second)/fabs(worst_score) + 1;
    ratio[i].second = score;
    total_unit += score;
  }
  float unit_size = float(pnum-1-last_pnum) / total_unit;

  sort(ratio.begin(),ratio.end(),sortfunction);
  int rest_res = pnum-1-last_pnum;
  assert(rest_res > 0);
  for(int i = 0; i < ratio.size(); i++) {
    int space_id = ratio[i].first;
    float res_size = ratio[i].second*unit_size;
    int alloc_res = rest_res < int(ceil(res_size)) ? rest_res:int(ceil(res_size));
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
    printf("space_id %d ratio: %f, allocate res: %d\n",space_id,ratio[i].second,
        alloc_res);
    for(int j = 0; j < alloc_res; j++) {

      if(share_best){
        fstream ftr;
        char name[500];
        sprintf(name,"StartPointSpace%d.json",last_pnum+1);
        if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
        else {printf("Remove successfully %s\n",name);}

        if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",
            space_id);
        if(space2best.count(space_id) > 0 && false) { //Do not partition
          ftr.open(name,fstream::out);
          ftr<<"{";

          for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++)
          {
            ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
            string type = name2type[space2best[space_id]->name2choice[t_i].first];
            if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].
              second<<"\"";
            else ftr<<space2best[space_id]->name2choice[t_i].second;
            if(t_i!=space2best[space_id]->name2choice.size()-1) ftr<<", ";
          }

          ftr<<"}";
          ftr.close();
        }
      }

      Task* task = new Task(space,5);
      assert(task != NULL);
      Send_Task(task,last_pnum+1);
      last_pnum++;
      printf("Iter: %d, Send task: Space %d => Pnum %d\n",iter,space_id,last_pnum);
    }
    rest_res -= alloc_res;
    assert(rest_res >= 0);
    if(rest_res == 0) break;
  }

}

void taskAssign_cyclic(int pull_arms,map<string,string> name2type, map<int,Result*>
    space2best, bool share_best, map<int,Space*> spaceBuf, vector<pair<int,float> >reward,
    int pnum, int iter){
  printf("Iter: %d, #spaces: %d, #pnum: %d, #pull_arms: %d\n",iter,spaceBuf.size(),
      pnum-1, pull_arms);
  for(int i = 1; i < pnum; i++) {
    int index = i % pull_arms;
    if(index == 0) index = pull_arms;
    int space_id = reward[index-1].first;
    assert(spaceBuf.count(space_id) > 0);
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);

    if(share_best){
      fstream ftr;
      char name[500];
      sprintf(name,"StartPointSpace%d.json",i);
      remove(name);
      if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",
          space_id);
      if(space2best.count(space_id) > 0) {
        ftr.open(name,fstream::out);
        ftr<<"{";

        for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].
            second<<"\"";
          else ftr<<space2best[space_id]->name2choice[t_i].second;
          if(t_i!=space2best[space_id]->name2choice.size()-1) ftr<<", ";
        }

        ftr<<"}";
        ftr.close();
      }
    }
    Task* task = new Task(space,5);
    assert(task != NULL);
    Send_Task(task,i);
    printf("Iter: %d, Send task: Space %d => Pnum %d\n",iter,space_id,i);
  }
}
