#include <cfloat>
#include <cstdio>
#include <cassert>
#include <map>
#include <string>
#include <vector>
#include <utility>
#include <unistd.h>
#include <cstdlib>
#include <iostream>
#include <Python.h>
#include "mpi.h"
#include "structure.h"
#include "msg_passing.h"
#include "autotuner.h"
#include "space_partition.h"

using namespace std;

int main(int argc, char** argv) {
  if(argc < 6) {
    printf("./worker <--design DESIGN-NAME> <--path WORKSPACE-PATH> <--pycode PYTHON-CODE> \n");
    return 0;
  }
  /*************MPI initialization*******************/
  int myrank;
  int pnum;
  int len;
  char hostname[MPI_MAX_PROCESSOR_NAME];
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
  MPI_Comm_size(MPI_COMM_WORLD,&pnum);
  MPI_Get_processor_name(hostname,&len);
  
  int tune_type = 0; //1: vtr 2: vivado 3: quartus 4: other
  MPI_Recv(&tune_type,1,MPI_INT,0,0,MPI_COMM_WORLD,&status);
  int share_best = 1; //0:false 1:true
  MPI_Recv(&share_best,1,MPI_INT,0,0,MPI_COMM_WORLD,&status);
  
  /**************parse parameters*********************/
  string spacepath = "";
  string pycode    = "";
  string design    = "";
  int tune_cst     = 0;
  int fake_argc    = 0;
  char** fake_argv = NULL;
  vector<string> tmp_fake_argv;
  
  for(int i = 0; i < argc; i++) {
    if(strcmp(argv[i],"-path") == 0) {
      assert(i < argc-1);
      spacepath = string(argv[i+1]);
      i++;
      continue;
    }
    if(strcmp(argv[i],"-design") == 0) {
      assert(i < argc-1);
      design = string(argv[i+1]);
      i++;
      continue;
    }
    if(strcmp(argv[i],"-pycode") == 0) {
      assert(i < argc-1);
      pycode=string(argv[i+1]);
      i++;
      continue;
    }
    if(strcmp(argv[i],"-tune_cst") == 0) {
      assert(i < argc-1);
      tune_cst = atoi(argv[i+1]);
      i++;
      continue;
    }

    tmp_fake_argv.push_back(string(argv[i])); //set static parameters like --parallism=1
  }

  char rankname[50];
  sprintf(rankname,"--myrank=%d",myrank);
  tmp_fake_argv.push_back(string(rankname));
  sprintf(rankname,"r%d.db",myrank);
  string db_path = "--database="+spacepath+"/"+rankname;
  tmp_fake_argv.push_back(db_path)

  if(share_best) {
    tmp_fake_argv.push_back("--seed-configuration");
    char name[500];
    sprintf(name,"StartPointSpace%d.json",myrank);
    tmp_fake_argv.push_back(string(name));
  }


  /***********invoke autotuner****************/
  Py_Initialize();
  if(!Py_IsInitialized()) return -1;
  
  int result_id = 0; 
  int cond = 0;//0:stop, 1:autotuning
  while(1) {
    MPI_Recv(&cond,1,MPI_INT,0,0,MPI_COMM_WORLD,&status);
    if(cond == 0) break;  
    int limit;
    MPI_Recv(&limit,1,MPI_INT,0,0,MPI_COMM_WORLD,&status);
    
    {//generate arguments for OpenTuner
      char str_limit[10];
      sprintf(str_limit,"%d",limit);
      bool flag_limit = false;
      for(int i = 0; i < tmp_fake_argv.size(); i++) {
        if(tmp_fake_argv[i].find("test-limit") != string::npos) {
          assert(i < tmp_fake_argv.size()-1);
          tmp_fake_argv[i+1] = string(str_limit);
          flag_limit = true;
          break;
        }
      }
      if(!flag_limit) {
        tmp_fake_argv.push_back("--test-limit");
        tmp_fake_argv.push_back(string(str_limit));
      }
      fake_argc = tmp_fake_argv.size();
      assert(!fake_argv);
      fake_argv = new char*[fake_argc];
      for(int i = 0; i < fake_argc; i++) {
        fake_argv[i] = new char[100];
        strcpy(fake_argv[i],tmp_fake_argv[i].c_str());
      }
    }
    PySys_SetArgv(fake_argc,fake_argv);

    Task* task = NULL;
    Recv_Task(task, 0);
    assert(task != NULL);

    vector<Result*> results;
    AutoTuner* tuner = new AutoTuner(task->subspace->id, design, tune_type, tune_cst); //start from 1
    assert(tuner != NULL);
    tuner->callOpenTuner(task,results,myrank,spacepath,pycode);
#ifdef DEBUG_MSG
    printf("rank %d sending results, result size %d\n",myrank, results.size());
    printf("debug worker results: \n");
    for(int i = 0; i < results.size(); i++) {
      printf("%d\n",i)
      for(int j = 0; j < results[i]->name2choice.size(); j++) {
        printf("%s : %s  ",results[i]->name2choice[j].first.c_str(), results[i]->name2choice[j].second.c_str());
      }
      printf("\n");
    }
    printf("finish\n");
#endif
    
    Send_MultiResult(results,0);
    
    if(fake_argv) {
      for(int i = 0; i < fake_argc; i++) {delete []fake_argv[i]; fake_argv[i] = NULL;}
      delete []fake_argv; fake_argv=NULL;
    }
  }

  Py_Finalize();
  MPI_Finalize();
  return 0;
}
