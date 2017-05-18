#include "space_divider.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <iostream>
#include <fstream>
#include <vector>
#include "structure.h"

using namespace std;

void genOrgSpace(Space*& orgSpace, string file) {
  fstream ftr;
  ftr.open(file.c_str(), fstream::in);
  assert(ftr.is_open());
  vector<Param*> params;

  //modify!!!
  char buf[1000];
  while(!ftr.eof()) {
    ftr.getline(buf,1000);
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
    }
    if(type == "FloatParameter") {
      ptr = strtok(NULL, " ,{}[]");
      tmp->min = atof(ptr);
      ptr = strtok(NULL, " ,{}[]");
      tmp->max = atof(ptr);
    }
    //how to support IntegerParameter??
    if(type == "IntegerParameter") {
      ptr = strtok(NULL, " ,{}[]");
      tmp->min = atoi(ptr);
      ptr = strtok(NULL, " ,{}[]");
      tmp->max = atoi(ptr);
    }
    params.push_back(tmp);
  }

  ftr.close();

  orgSpace = new Space(params,0);
  assert(orgSpace != NULL);
}


