#include "space_generator.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <climits>
#include <cassert>
#include <iostream>
#include <fstream>
#include <vector>
#include "structure.h"

using namespace std;

void genOrgSpace(Space*& orgSpace, string file, int &search_space_size) {
  fstream ftr;
  ftr.open(file.c_str(), fstream::in);
  assert(ftr.is_open());
  vector<Param*> params;

  search_space_size = 1;
  //modify!!!
  char buf[10000];
  while(!ftr.eof()) {
    ftr.getline(buf,10000);
    if(ftr.eof()) break;
    char* ptr;
    ptr = strtok(buf," ,{}[]");
    string name = string(ptr);
    ptr = strtok(NULL," ,{}[]");
    string type = string(ptr);
    Param* tmp = new Param(name,type);
    if(type == "EnumParameter") {
      ptr = strtok(NULL, " ,{}[]");
      while(ptr) {
        tmp->options.push_back(string(ptr));
        ptr = strtok(NULL, " ,{}[]");
      }
      if(search_space_size != +INT_MAX)
        search_space_size = search_space_size*tmp->options.size();
    }
    if(type == "FloatParameter") {
      ptr = strtok(NULL, " ,{}[]");
      tmp->min = atof(ptr);
      ptr = strtok(NULL, " ,{}[]");
      tmp->max = atof(ptr);
      search_space_size = +INT_MAX;
    }
    //how to support IntegerParameter??
    if(type == "IntegerParameter") {
      ptr = strtok(NULL, " ,{}[]");
      tmp->min = atoi(ptr);
      ptr = strtok(NULL, " ,{}[]");
      tmp->max = atoi(ptr);
      if(search_space_size != +INT_MAX) 
        search_space_size = search_space_size*(tmp->max-tmp->min+1);
    }
    params.push_back(tmp);
  }

  ftr.close();

  orgSpace = new Space(params,0);
  assert(orgSpace != NULL);
  return;
}

void initDivision(Space* orgSpace, map<int,Space*>& space_buffer) {
  Space* subspace = new Space(orgSpace->params,1);
  assert(subspace != NULL);
  space_buffer.insert(pair<int,Space*>(1,subspace));
  assert(space_buffer.size() != 0);
  return;
}


