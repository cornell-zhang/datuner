#ifndef _SPACE_PARTITION_H__
#define _SPACE_PARTITION_H__
#include <map>
#include <vector>
#include <utility>
#include <string>
#include "structure.h"


std::string getValue(std::string param_name, Space*, float);
void param_entropy(std::map<int,std::vector<Result*> >points, Space*, Space*, float, std::vector<std::string>&);
bool is_single_param(Param*,Space*);
int lenRatio(Param*,Param*);
int paramSize(Param*,Space*);
bool spaceSize(Space*,Space*,int);
Param* getParam(Space*,std::string);
void gennewSpace(Space*,Param*, int, std::vector<Space*>&);
void space_partition(float, int, Space*, std::map<int,std::vector<Result*> >&, std::map<int,Result*>&, std::map<int,Space*>&, int&, int&);

#endif
