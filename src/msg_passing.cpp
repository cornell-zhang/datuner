#include "msg_passing.h"
#include <cassert>
#include <string>
#include <vector>
#include <utility>
#include <iostream>
#include "structure.h"
#include "mpi.h"

using namespace std;

void MPI_Send_Str(string str, int dst) {
  MPI_Send(str.c_str(), str.size(), MPI_CHAR, dst, 0, MPI_COMM_WORLD);
}
void MPI_Recv_Str(std::string& str, int src) {
  MPI_Status status;
  char buf[50];
  MPI_Recv(&buf, 50, MPI_CHAR, src, 0, MPI_COMM_WORLD, &status);
  int count;
  MPI_Get_count(&status,MPI_CHAR,&count);
  str = string(buf).substr(0,count);
}
void Send_Task(Task* task, int dst) {
  assert(task != NULL);
  MPI_Send(&task->step,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  MPI_Send(&task->subspace->id,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  int size = task->subspace->params.size();
  MPI_Send(&size,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  for(int i = 0; i < size; i++) {
    Param* tmp_param = task->subspace->params[i];
    MPI_Send_Str(tmp_param->name,dst);
    MPI_Send_Str(tmp_param->type,dst);
    MPI_Send_Str(tmp_param->defVal,dst);
    MPI_Send(&tmp_param->min,1,MPI_FLOAT,dst,0,MPI_COMM_WORLD);
    MPI_Send(&tmp_param->max,1,MPI_FLOAT,dst,0,MPI_COMM_WORLD);
    int opt_size = tmp_param->options.size();
    MPI_Send(&opt_size,1,MPI_INT,dst,0,MPI_COMM_WORLD);
    for(int k = 0; k < opt_size; k++) {
      MPI_Send_Str(tmp_param->options[k],dst);
    }
  }
}
void Recv_Task(Task*& task, int src) {
  MPI_Status status;
  task = new Task();
  task->subspace = new Space();
  MPI_Recv(&task->step,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);
  MPI_Recv(&task->subspace->id,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);
  int size;
  MPI_Recv(&size,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);

  for(int i = 0; i < size; i++) {
    Param* tmpparam = new Param();
    assert(tmpparam != NULL);
    MPI_Recv_Str(tmpparam->name,src);
    MPI_Recv_Str(tmpparam->type,src);
    MPI_Recv_Str(tmpparam->defVal,src);
    MPI_Recv(&tmpparam->min,1,MPI_FLOAT,src,0,MPI_COMM_WORLD,&status);
    MPI_Recv(&tmpparam->max,1,MPI_FLOAT,src,0,MPI_COMM_WORLD,&status);
    int opt_size;
    MPI_Recv(&opt_size,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);
    tmpparam->options.resize(opt_size);
    for(int j = 0; j < opt_size; j++) {
      MPI_Recv_Str(tmpparam->options[j],src);
    }
    task->subspace->params.push_back(tmpparam);
  }
}
void Send_Result(Result* result, int dst) {
  assert(result != NULL);
  MPI_Send(&result->score, 1, MPI_FLOAT,dst,0,MPI_COMM_WORLD);
  MPI_Send(&result->id,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  int size = result->name2choice.size();
  MPI_Send(&size,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  for(int i = 0; i < size; i++) {
    string name = result->name2choice[i].first;
    string choice = result->name2choice[i].second;
    MPI_Send_Str(name,dst);
    MPI_Send_Str(choice,dst);
  }
}
void Send_MultiResult(vector<Result*> results, int dst) {
  int count = results.size();
  MPI_Send(&count,1,MPI_INT,dst,0,MPI_COMM_WORLD);
  for(int i = 0; i < count; i++) {
    Result* result = results[i];
    assert(result != NULL);
    Send_Result(result,dst);
  }
}

void Recv_Result(Result*& result, int src) {
  MPI_Status status;
  result = new Result();
  MPI_Recv(&result->score,1,MPI_FLOAT,src,0,MPI_COMM_WORLD,&status);
  MPI_Recv(&result->id,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);
  int size;
  MPI_Recv(&size,1,MPI_INT,src,0,MPI_COMM_WORLD,&status);
  for(int i = 0; i < size; i++) {
    string name;
    string choice;
    MPI_Recv_Str(name,src);
    MPI_Recv_Str(choice,src);
    pair<string,string> tmp_pair = make_pair(name,choice);
    result->name2choice.push_back(tmp_pair);
  }
}

void Recv_MultiResult(vector<Result*> &results, int src) {
  MPI_Status status;
  int count;
  MPI_Recv(&count, 1,MPI_INT, src, 0, MPI_COMM_WORLD, &status);
  for(int i = 0; i < count; i++) {
    Result* result = NULL;
    Recv_Result(result,src);
    assert(result != NULL);
    results.push_back(result);
  }
}

