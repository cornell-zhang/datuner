#include <cstdio>
#include "mpi.h"
#include <vector>
#include "space_divider4Vivado.h"
#include "space_divider4VPR.h"
#include "space_divider4ISE.h"
#include "structure.h"
#include "bandit.h"
#include "space_partition.h"
#include "msg_passing.h"
#include <cassert>
#include <map>
#include <cmath>
#include <cfloat>
#include <iostream>
#include <fstream>
#include <cstring>
#include <algorithm>
#include <cstdlib>

using namespace std;

bool myfunction2(pair<int,float> p1, pair<int,float> p2) {return p1.second > p2.second;}

bool ready_2_par_space(int iter,int,int);

void taskAssign_fix(bool stop_partition, map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> spaceBuf, int pnum) {
  assert(pnum-1 == spaceBuf.size());
  for(int i = 1; i < pnum; i++) {
    int space_id = i;
    assert(spaceBuf.count(space_id) > 0);
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);

    if(share_best){
      fstream ftr;
      char name[50];
      sprintf(name,"StartPointSpace%d.json",i);
      if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
      if(space2best.count(space_id) > 0 && stop_partition) {
        ftr.open(name,fstream::out);
        ftr<<"{";
        for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].second<<"\"";
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
  }
}


void taskAssign_best(bool stop_partition, map<string,string> name2type, map<int,
    Result*> space2best, bool share_best, map<int,Space*> spaceBuf, int pnum, int best_spaceid) {
  for(int i = 1; i < pnum; i++) {
    assert(spaceBuf.count(best_spaceid) > 0);
    Space* space = spaceBuf.find(best_spaceid)->second;
    assert(space != NULL);

    /*
    if(share_best){
      fstream ftr;
      char name[50];
      sprintf(name,"StartPointSpace%d.json",i);
      if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
      if(space2best.count(space_id) > 0 && stop_partition) {
        ftr.open(name,fstream::out);
        ftr<<"{";
        for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]-
            >name2choice[t_i].second<<"\"";
          else ftr<<space2best[space_id]->name2choice[t_i].second;
          if(t_i!=space2best[space_id]->name2choice.size()-1) ftr<<", ";
        }
        ftr<<"}";
        ftr.close();
      }
    }*/

    Task* task = new Task(space,5);
    assert(task != NULL);
    Send_Task(task,i);
  }
}


void taskAssign_old(bool stop_partition, map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> spaceBuf, vector<pair<int,float> >reward, int pnum, int iter){
  int pull_arms = 8;
  pull_arms = pull_arms < spaceBuf.size() ? pull_arms : spaceBuf.size();
  printf("Iter: %d, #spaces: %d, #pnum: %d, #pull_arms: %d\n",iter,spaceBuf.size(), pnum-1, pull_arms);
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
      if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
      else {printf("remove successfully %s\n",name);}
      if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",space_id);
      if(space2best.count(space_id) > 0 && stop_partition) {
        ftr.open(name,fstream::out);
        ftr<<"{";
     
        for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].second<<"\"";
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

void taskAssign(bool stop_partition, map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> spaceBuf, vector<pair<int,float> >reward, map<int,vector<Result*> > points, int pnum, int iter){
  int pull_arms = 4;
  int last_pnum = 0;
  int real_num = pull_arms < spaceBuf.size() ? pull_arms : spaceBuf.size();
  bool flag = true;
  for(int i = 0; i < real_num; i++) {
    int space_id = reward[i].first;
    if(points.count(space_id) <= 0) {
      flag = false;
      break;
    }
  }
  if(!flag) {
    taskAssign_old(stop_partition, name2type, space2best,share_best,spaceBuf,reward,pnum,iter);
    return;
  }
  
  for(int i = 0; i < real_num; i++) {
    int space_id = reward[i].first;
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
  
    if(share_best){
      fstream ftr;
      char name[500];
      sprintf(name,"StartPointSpace%d.json",last_pnum+1);
      if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
      else{printf("remove successfully %s\n",name);}
      if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",space_id);
      if(space2best.count(space_id) > 0 && stop_partition) {
        ftr.open(name,fstream::out);
        ftr<<"{";
        
                for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].second<<"\"";
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
 
  sort(ratio.begin(),ratio.end(),myfunction2);
  int rest_res = pnum-1-last_pnum;
  assert(rest_res > 0);
  for(int i = 0; i < ratio.size(); i++) {
    int space_id = ratio[i].first;
    float res_size = ratio[i].second*unit_size;
    int alloc_res = rest_res < int(ceil(res_size)) ? rest_res:int(ceil(res_size));
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
    printf("space_id %d ratio: %f, allocate res: %d\n",space_id,ratio[i].second,alloc_res);
    for(int j = 0; j < alloc_res; j++) {
     
    if(share_best){
      fstream ftr;
      char name[500];
      //sprintf(name,"/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/my/ch_intrinsics/StartPointSpace%d.json",last_pnum+1);
      sprintf(name,"StartPointSpace%d.json",last_pnum+1);
      if(remove(name) != 0) {printf("Error can't remove %s\n",name);}
      else {printf("Remove successfully %s\n",name);}
      
      if(space2best.count(space_id) <= 0) printf("for space id %d no best found\n",space_id);
      if(space2best.count(space_id) > 0 && false) { //Do not partition
        ftr.open(name,fstream::out);
        ftr<<"{";
        
                for(int t_i = 0; t_i < space2best[space_id]->name2choice.size(); t_i++) {
          ftr<<"\""<<space2best[space_id]->name2choice[t_i].first<<"\": ";
          string type = name2type[space2best[space_id]->name2choice[t_i].first];
          if(type == "EnumParameter") ftr<<"\""<<space2best[space_id]->name2choice[t_i].second<<"\"";
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


void correct_check(map<int,Space*> spaceBuf, vector<int> arms) {
  cout<<"debug spaceBuf "<<spaceBuf.size()<<" arms: "<<arms.size()<<endl;
  assert(spaceBuf.size() == arms.size());
  //for(map<int,Space*>::iterator it = spaceBuf.begin(); it != spaceBuf.end(); it++) cout<<it->first<<endl;
  //for(int i = 0; i < arms.size(); i++) cout<<arms[i]<<endl;
  for(int i = 0; i < arms.size(); i++) {
    assert(spaceBuf.count(arms[i]) > 0);
  }
}

int main(int argc, char** argv){

  if(argc < 2) {
    printf("./master <-vpr|-vivado> \n");
    return 0;
  }
  string tmp_vpr = "-vpr";
  string tmp_ise = "-ise";
  string tmp_vivado = "-vivado";
  string tmp_whole = "-whole"; //simple parallelization
  string tmp_restart = "-restart"; //simple parallelization with restart
  string tmp_exp1 = "-exp-fix"; //fix partition
  string tmp_exp2 = "-exp-fix-MAB";
  string tmp_best = "-best"; //set seed
  string tmp_tcst = "-tunecst"; //tune timing constraint for Vivado
  double tcst_default = 0.0;
  double tcst_max = 0.5;
  bool vpr_flag = false;
  bool vivado_flag = false;
  bool ise_flag = false;
  bool whole_flag = false;
  bool restart_flag = false;
  bool exp_fix = false;
  bool exp_fix_MAB = false;
  bool share_best = true;
  bool vivado_default = false;
  for(int i = 0; i < argc; i++) {
    printf("%s\n",argv[i]);
    if(strcmp(argv[i],tmp_tcst.c_str()) == 0) {
      assert(i < argc-2);
      tcst_default = atof(argv[i+1]);
      tcst_max = atof(argv[i+2]);
      vivado_default = true;
    }
    if(strcmp(argv[i],tmp_vpr.c_str()) == 0) vpr_flag = true;
    if(strcmp(argv[i],tmp_ise.c_str()) == 0) ise_flag = true;
    if(strcmp(argv[i],tmp_vivado.c_str()) == 0) vivado_flag = true;
    if(strcmp(argv[i],tmp_whole.c_str()) == 0) whole_flag = true;
    if(strcmp(argv[i],tmp_restart.c_str()) == 0) restart_flag = true;
    if(strcmp(argv[i],tmp_exp1.c_str()) == 0) exp_fix = true;
    if(strcmp(argv[i],tmp_exp2.c_str()) == 0) exp_fix_MAB = true;
    //if(strcmp(argv[i],tmp_best.c_str()) == 0) share_best = true;
  }
  if(vivado_flag) assert(vivado_default);
  assert(vpr_flag||vivado_flag||ise_flag);

  //Static space division
  Space* orgSpace = NULL;
  if(vpr_flag) genOrgSpace4VPR(orgSpace);
  if(vivado_flag) genOrgSpace4Vivado(orgSpace,tcst_default,tcst_max);
  if(ise_flag) genOrgSpace4ISE(orgSpace);
  assert(orgSpace != NULL);
  map<string,string> name2type;
  {
    for(int i = 0; i < orgSpace->params.size(); i++) {
      Param* param = orgSpace->params[i];
      name2type.insert(pair<string,string>(param->name,param->type));
    }
  }

  map<int,Space*> spaceBuf;
  if(exp_fix||exp_fix_MAB) {
    if(vpr_flag) initDivision8_VPR(orgSpace,spaceBuf);
    if(vivado_flag) initDivision8_Vivado(orgSpace,spaceBuf);
  }
  else initDivision(orgSpace,spaceBuf);

  assert(spaceBuf.size() != 0);
  Bandit* auc_bandit = new Bandit(spaceBuf.size());
  assert(auc_bandit != NULL);
  vector<int> tmp_arms;
  auc_bandit->arms(tmp_arms);
  correct_check(spaceBuf,tmp_arms);
  int old_max_id = spaceBuf.size();//start from one;

  
  //MPI initialization
  int myrank;
  int pnum;
  int len;
  char hostname[MPI_MAX_PROCESSOR_NAME];
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
  MPI_Comm_size(MPI_COMM_WORLD,&pnum);
  MPI_Get_processor_name(hostname,&len);
  printf("#Controller = %d, myrank = %d, running on %s\n",pnum,myrank,hostname);

  int tune_type = 0;
  if(vpr_flag) tune_type = 1;
  if(vivado_flag) tune_type = 2;
  if(ise_flag) tune_type = 3;
  
  printf("DBUGE!!! %d\n",tune_type);
  
  for(int i = 1; i < pnum; i++) MPI_Send(&tune_type,1,MPI_INT,i,0,MPI_COMM_WORLD);
  
  int exp_type = 0;
  if(whole_flag) exp_type = 2;
  else if(restart_flag) exp_type = 3;
  else if(exp_fix) exp_type = 4;
  else if(exp_fix_MAB) exp_type = 5;
  else exp_type = 1; //my
  for(int i = 1; i < pnum; i++) MPI_Send(&exp_type,1,MPI_INT,i,0,MPI_COMM_WORLD);
  
  int share_best_int = 0;
  if(share_best) share_best_int = 1;
  for(int i = 1; i < pnum; i++) MPI_Send(&share_best_int,1,MPI_INT,i,0,MPI_COMM_WORLD);

  map<int,vector<Result*> > points; //space2results 
  map<int,Result*> space2best;
  
  int round = 30; //total #iterations
  int iter = 1; //iteration counter
  int cond = 0; //condition flag
  int limit = 10; //#steps per iteration

  bool can_partition=true;
  if(whole_flag || exp_fix) {round = 2; limit=300; can_partition = false;}
  if(vivado_flag && !exp_fix && !whole_flag) {limit=5;}

  bool stop_partition = false;
  if(vpr_flag||vivado_flag) stop_partition = true; //check for vivado
  if(exp_fix_MAB) {stop_partition = true; can_partition = false;}
  if(vpr_flag && exp_fix_MAB) {limit=10; round =30;} //CHECK!!!!!

  //if(vpr_flag && exp_fix) {limit=30; round = 5;} //CHECK!!!!!

  printf("master send task\n");
  printf("DEBUG!!! round %d, limit %d\n", round, limit);

  while(iter < round) {
    //if(vpr_flag && exp_fix_MAB && iter > 1) limit=60;
    printf("Iter %d\n",iter);
    cond = 1;
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);
    }

    //if(iter == round-1) limit = 200;
    /*if(iter == 1) limit=30;
    else if(iter == round -1) limit=100;
    else limit = 10;*/
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&limit,1,MPI_INT,i,0,MPI_COMM_WORLD);
    }


    vector<pair<int,float> > reward;
    auc_bandit->cal_rewards(points,reward);
    sort(reward.begin(), reward.end(), myfunction2);
    
    for(int i = 0; i < reward.size(); i++) {
      printf("%d, %f\n",reward[i].first,reward[i].second);
    }
    
    //TODO:check options
    /*if(iter == round-1) {
      int best_spaceid = reward[reward.size()-1].first;
      taskAssign_best(stop_partition, name2type, space2best, share_best, spaceBuf, pnum, best_spaceid);
    }
    else {*/
      if(exp_fix) taskAssign_fix(stop_partition, name2type,space2best,share_best,spaceBuf, pnum);
      else taskAssign(stop_partition, name2type, space2best,share_best,spaceBuf, reward, points, pnum, iter);
    //}

    map<int,float> spaceid2result;
    for(int i = 1; i < pnum; i++) {
      vector<Result*> result_buf;
      Recv_MultiResult(result_buf,i);
      assert(result_buf.size() != 0);
      for(int j = 0; j < result_buf.size(); j++) {
        Result* result = result_buf[j];
        assert(result != NULL);
        printf("debug recved result proc %d, space %d, wns %f\n",i,result->id, result->score);
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
    for(map<int,float>::iterator im = spaceid2result.begin(); im != spaceid2result.end(); im++) 
      auc_bandit->on_result(im->first,im->second);


    //check space division
    if(ready_2_par_space(iter,spaceBuf.size(),pnum-1)&& can_partition) {
      int remove_id;
      int add_num;
      space_partition(100, old_max_id, orgSpace, points, space2best, spaceBuf,remove_id,add_num); //100 is the fake number
      if(add_num > 0) auc_bandit->update_bandit(remove_id,add_num); 
      vector<int> tmp_arms;
      auc_bandit->arms(tmp_arms);
      correct_check(spaceBuf,tmp_arms);
      old_max_id += add_num;
    }
    if(!ready_2_par_space(iter,spaceBuf.size(),pnum-1)&& can_partition) {
      if(vpr_flag) {limit+=5;}
      if(vivado_flag) {limit = 10; stop_partition = true;}
    }

    iter++;
  }

  //output searching points
  cond = 0;
  for(int i = 1; i < pnum; i++)
    MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);

  MPI_Finalize();
  return 0;
}

bool ready_2_par_space(int iter, int size, int processNum) {
  //return false;
  //if(iter %1 == 0) return true;
  if(iter < 15 || size < 3*processNum) return true;
  else return false;
}
