#ifndef __MSG_PASSING_H__
#define __MSG_PASSING_H__
#include "structure.h"
#include <string>
#include <vector>

void MPI_Send_Str(std::string str, int dst);
void MPI_Recv_Str(std::string& str, int src);
void Send_Task(Task*, int dst);
void Recv_Task(Task*&, int src);
void Send_Result(Result*, int dst);
void Send_MultiResult(std::vector<Result*>, int dst);
void Recv_Result(Result*&, int src);
void Recv_MultiResult(std::vector<Result*>&, int src);

#endif
