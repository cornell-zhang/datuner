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
#include "space_generator.h"
#include "structure.h"
#include "bandit.h"
#include "space_partition.h"
#include "msg_passing.h"
#include "stopwatch.h"
#include "database.h"

using namespace std;

bool sortfunction(pair<int,float> p1, pair<int,float> p2) {return p1.second > p2.second;}
bool stop_partition(int iter,int size, int proc_num);
void gen_ref_starting_point(char* name, Result* result, map<string, string> name2type);
void taskAssign(map<string,string> name2type, map<int,Result*> space2best, bool share_best, map<int,Space*> space_buffer, vector<pair<int,float> >reward, map<int,vector<Result*> > points, int proc_num, int iter);


int main(int argc, char** argv){

  if(argc < 3) {
    cerr<<"Usage: ./master <vtr|vivado|quartus|other> <--path WORKSPACE-PATH>  [--space SPACE-DEFINITION-FILE] [--test-limit TEST-LIMIT] \
      [--stop-after STOP-AFTER] [--search-per-iter SEARCH-PER-ITERATION]";
    exit(EXIT_FAILURE);
  }
  
  fstream output_ftr;
  output_ftr.open("tune.log",fstream::out);
  output_ftr<<"--------------------------------------"<<endl;
  output_ftr<<"Start DATuner......."<<endl;
  output_ftr<<"--------------------------------------"<<endl;

  /******** parse parameters ***********/
  enum app{vtr,vivado,quartus,other};
  app myApp = other; 
  string workspace_path = "";
  string space_definition_file = "";
  int limits = 100; //default: run 100 times of searches
  double tune_time = 7200; //default: tune 2 hours
  int search_per_iter = 1; //default: run 5 searches in each iteration
  bool share_best = true;

  for(int i = 0; i < argc; i++) {
    if(string(argv[i]).find("vtr") != string::npos) {
      myApp = vtr;
      space_definition_file = "./vtr_space.txt";
    }
    if(string(argv[i]).find("vivado") != string::npos) {
      myApp = vivado;
      space_definition_file = "./vivado_space.txt";
    }
    if(string(argv[i]).find("quartus") != string::npos) {
      myApp = quartus;
      space_definition_file = "./quartus_space.txt";
    }
    if(string(argv[i]) == "--space") {
      assert(i < argc-1);
      space_definition_file = string(argv[i+1]);
    }
    if(string(argv[i]) == "--test-limit") {
      assert(i < argc-1);
      limits = atoi(argv[i+1]);
    }
    if(string(argv[i]) == "--stop-after") {
      assert(i < argc-1);
      tune_time = atof(argv[i+1]);
    }
    if(string(argv[i]) == "--path") {
      assert(i < argc-1);
      workspace_path = string(argv[i+1]);
    }
    if(string(argv[i]) == "--search-per-iter") {
      assert(i < argc-1);
      search_per_iter = atoi(argv[i+1]);
    }
  }

  output_ftr<<"configuration: test-limit: "<<limits<<" stop-after: "<<tune_time<<"(s)"<<endl;
  
  /******** generate solution space from space_definition_file ************/
  int space_size;
  Space* orgSpace = NULL;
  genOrgSpace(orgSpace,space_definition_file, space_size);
  assert(orgSpace);

  map<string,string> name2type;
  {
    for(int i = 0; i < orgSpace->params.size(); i++) {
      Param* param = orgSpace->params[i];
      name2type.insert(pair<string,string>(param->name,param->type));
    }
  }

  /******** initial space buffer **************************************/
  map<int,Space*> space_buffer;
  initDivision(orgSpace,space_buffer);
  assert(space_buffer.size() != 0);

  Bandit* auc_bandit = new Bandit(space_buffer.size());
  assert(auc_bandit);
  auc_bandit->check_arms(space_buffer);
  int last_space_id = space_buffer.size();//index startting from one;

  /********* MPI initialization *********/
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
  else if(myApp == vivado) tune_type = 2;
  else if(myApp == quartus) tune_type = 3;
  else tune_type = 4;
  for(int i = 1; i < pnum; i++) MPI_Send(&tune_type, 1,MPI_INT,i,0,MPI_COMM_WORLD);
  int use_best_prev_cfg = 0;
  if(share_best) use_best_prev_cfg = 1;
  for(int i = 1; i < pnum; i++) MPI_Send(&use_best_prev_cfg, 1, MPI_INT, i, 0, MPI_COMM_WORLD);

  /********database to save results**********/
  map<int,vector<Result*> > points; //space2results 
  map<int,Result*> space2best; //the best point in each subspace
  
  DataBase* db = new DataBase(workspace_path);
  if(!db->OpenDB()) return -1;
  if(!db->CreateTable(orgSpace)) return -1;
  
  /********searching**************/
  Stopwatch timer;
  init(&timer, CLOCK_REALTIME);
  int num_samples = 0;
  int iter = 0; //iteration counter
  int cond = 0; //condition flag: indicates whether stop or not 
  Result* gbest_result = NULL; //global best result
  int total_round = ceil(limits/search_per_iter); //#round of iterations

  while(1) {
    tick(&timer);
    cond = 1;//go! tuning
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);
    }
    for(int i = 1; i < pnum; i++) {
      MPI_Send(&search_per_iter,1,MPI_INT,i,0,MPI_COMM_WORLD);
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
      if(result_buf.size() != 0) {
        db->SaveResults(result_buf,num_samples);
        num_samples += result_buf.size();
        //printf("debug save result db OK\n");
      }
      for(int j = 0; j < result_buf.size(); j++) {
        Result* result = result_buf[j];
        assert(result != NULL);
        if(!gbest_result) gbest_result = result;
        else {
          if(result->score < gbest_result->score) gbest_result = result;
        }
        if(points.count(result->id) > 0) { //save samples by different subspace id
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

    //dynamic solution space partitioning
    if(!stop_partition(iter,space_buffer.size(),pnum-1)) {
      int remove_id; //leave becomes intermediate node & grow children
      int add_num;
      divide_space(last_space_id, orgSpace, points, space2best, space_buffer,remove_id,add_num);
      if(add_num > 0) auc_bandit->update_bandit(remove_id,add_num);
      auc_bandit->check_arms(space_buffer);
      last_space_id += add_num;
    }

    //checkpoint 
    stop(&timer);
    double runtime = seconds(&timer);
    output_ftr<<"tuning time "<<runtime<<" ..." <<endl;   
    
    //output
    iter++;
    output_ftr<<"Iter "<<iter<<endl;
    output_ftr<<" #subspaces: "<<space_buffer.size()<<endl;
    output_ftr<<" best QoR: "<<gbest_result->score<<endl;
    output_ftr<<" best cfg: ";
    for(int ti = 0; ti < gbest_result->name2choice.size(); ti++) {
      output_ftr<<gbest_result->name2choice[ti].first.c_str()<<" : "<<gbest_result->name2choice[ti].second.c_str()<<" ";
    }
    output_ftr<<endl;
    printf("[%6ds]    INFO Iter %3d,  num of subspace = %2d, QoR = %5f \n", int(runtime), iter, space_buffer.size(), gbest_result->score);
    if((iter >= total_round) || (runtime > tune_time) || (num_samples > space_size)) {
      //stop tuning conditions: 1) #searches exceeds search limits 2) run out of tuning time 3) the whole space has been searched  
      output_ftr<<"finish tuning"<<endl;
      break;
    }
  }

  //finish sample
  cond = 0; //stop tuning
  for(int i = 1; i < pnum; i++)
    MPI_Send(&cond,1,MPI_INT,i,0,MPI_COMM_WORLD);
  MPI_Finalize();
  output_ftr.close();
  if(!db->CloseDB()) return -1;
  return 0;
}

bool stop_partition(int iter, int size, int processNum) {
  if(iter > 15 || size > 4*processNum) return true;
  else return false;
}

void taskAssign(map<string, string> name2type, map<int, Result*> space2best, bool share_best,map<int, Space*> spaceBuf, vector<pair<int,float> >reward, map<int, vector<Result*> >points, int pnum, int iter) {
  vector<float> normalization;
  float sum = 0;
  for(int i = 0; i < reward.size(); i++) {
    sum += reward[i].second;
  }
  for(int i = 0; i < reward.size(); i++) {
    float normalized_score = reward[i].second/sum;
    assert(normalized_score >= 0);
    normalization.push_back(normalized_score);
  }

  int used_proc = 0;
  for(int i = 0; i < reward.size(); i++) {
    int tmp_num = ceil(normalization[i]*float(pnum-1));
    int alloc_res_num = (pnum-1 - used_proc) < tmp_num ? (pnum-1 - used_proc) : tmp_num;
    int space_id = reward[i].first;
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
    
    for(int j = 0; j < alloc_res_num; j++) {
      char name[50];
      sprintf(name,"StartPointSpace%d.json",used_proc+j+1);
      remove(name);
      if(space2best.count(space_id) > 0) {
        Result* tmp_result = space2best[space_id];
        assert(tmp_result != NULL);
        gen_ref_starting_point(name,tmp_result, name2type);
      }
      Task* task = new Task(space);
      assert(task != NULL);
      Send_Task(task,used_proc+j+1);
//ifdef DEBUG_MSG
      //printf("Iter: %d, Send task: Space %d => Pnum %d\n", iter, space_id, used_proc+j+1);
//endif
    }

    //finish task assignment
    used_proc += alloc_res_num;
    if(used_proc >= pnum-1) break;
  }

  //corner case: allocate the remaining process to the best subspace
  if(used_proc < pnum-1) {
    int space_id = reward[0].first; //best subspace
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
    for(int j = 0; j < pnum-1-used_proc; j++) {
      char name[50];
      sprintf(name,"StartPointSpace%d.json",used_proc+j+1);
      remove(name);
      if(space2best.count(space_id) > 0) {
        Result* tmp_result = space2best[space_id];
        assert(tmp_result != NULL);
        gen_ref_starting_point(name,tmp_result, name2type);
      }
      Task* task = new Task(space);
      assert(task != NULL);        
      Send_Task(task,used_proc+j+1);
#ifdef DEBUG_MSG
      //printf("Iter: %d, Send task: Space %d => Pnum %d\n", iter, space_id, used_proc+j+1);
#endif 
    }
  }

}

void gen_ref_starting_point(char* name, Result* result, map<string, string> name2type){
  fstream ftr;
  ftr.open(name, fstream::out);
  ftr<<"{";
  for(int t_i = 0; t_i < result->name2choice.size(); t_i++) {
    ftr<<"\""<<result->name2choice[t_i].first<<"\": ";
    string type = name2type[result->name2choice[t_i].first];
    if(type == "EnumParameter") ftr<<"\""<<result->name2choice[t_i].second<<"\"";
    else ftr<<result->name2choice[t_i].second;
    if(t_i!=result->name2choice.size()-1) ftr<<", ";
  }
  ftr<<"}";
  ftr.close();
  return;
}

