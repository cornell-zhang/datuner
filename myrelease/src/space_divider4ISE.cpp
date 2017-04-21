#include <iostream>
#include <vector>
#include <cassert>
#include "space_divider4ISE.h"
#include "structure.h"
#include <cstdio>
#include <cstdlib>

using namespace std;

void genOrgSpace4ISE(Space*& orgSpace) {
  vector<Param*> params; 
  Param* tmp = new Param("bp","EnumParameter","no");
  tmp->options.push_back("on");
  tmp->options.push_back("no");
  params.push_back(tmp);

  tmp = new Param("c","EnumParameter","100");
  tmp->options.push_back("1");
  tmp->options.push_back("100");
  params.push_back(tmp);

  tmp = new Param("ignore_keep_hierarchy","EnumParameter","no");
  tmp->options.push_back("on");
  tmp->options.push_back("no");
  params.push_back(tmp);

  tmp = new Param("ir","EnumParameter","no");
  tmp->options.push_back("no");
  tmp->options.push_back("all");
  tmp->options.push_back("off");
  tmp->options.push_back("place");
  params.push_back(tmp);
  
  tmp = new Param("lc","EnumParameter","off");
  tmp->options.push_back("off");
  tmp->options.push_back("auto");
  tmp->options.push_back("area");
  params.push_back(tmp);
  
  tmp = new Param("logic_opt","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);
  
  tmp = new Param("ol","EnumParameter","high");
  tmp->options.push_back("high");                       
  tmp->options.push_back("std");                      
  params.push_back(tmp);
  
  tmp = new Param("register_duplication","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);
  
  tmp = new Param("r","EnumParameter","4");
  tmp->options.push_back("4"); tmp->options.push_back("off"); tmp->options.push_back("8");
  params.push_back(tmp);
  
  tmp = new Param("t","EnumParameter","1");
  for(int i = 0; i < 100; i++) {
    char num[5];
    sprintf(num,"%d",i+1);
    tmp->options.push_back(num);
  }
  params.push_back(tmp);
  
  tmp = new Param("xe","EnumParameter","n");
  tmp->options.push_back("n"); 
  tmp->options.push_back("c");
  params.push_back(tmp);

  tmp = new Param("xt","EnumParameter","0");
  for(int i = 0; i <= 5; i++) {
    char num[5];
    sprintf(num,"%d",i);
    tmp->options.push_back(num);
  }
  params.push_back(tmp);
  
  tmp = new Param("pol","EnumParameter","high");
  tmp->options.push_back("std"); tmp->options.push_back("high"); 
  params.push_back(tmp);
  
  tmp = new Param("pxe","EnumParameter","n");
  tmp->options.push_back("n"); tmp->options.push_back("c"); 
  params.push_back(tmp);
  
  orgSpace = new Space(params,0);
  assert(orgSpace != NULL);
  /*
  for(int i = 0; i < orgSpace->params.size(); i++) {
    //cout<<orgSpace->params[i]->name<<endl;
    printf("%s,%s\n",orgSpace->params[i]->name, orgSpace->params[i]->type);
  }*/
}

void initDivision_ISE(Space* orgSpace, map<int,Space*>& spaceBuf) {
  Space* subspace = new Space(orgSpace->params,1);
  assert(subspace != NULL);
  spaceBuf.insert(pair<int,Space*>(1,subspace));
}

/*
void spaceDivision4VPR(Space* orgSpace, vector<Space*>& spaceBuf, int snum){
  //static division
  //TODO: dynamic division
  //alpha_t 0.1
  //allow_unrelated_clustering on/off
  spaceBuf.resize(0);
  vector<vector<string> > tmp;
  tmp.resize(snum);
  for(int i = 0; i < snum; i++) {
    tmp[i].resize(2);
  }
  tmp[0][0]="0.6"; tmp[0][1] = "on";
  tmp[1][0]="0.6"; tmp[1][1] = "off";
  tmp[2][0]="0.7"; tmp[2][1] = "on";
  tmp[3][0]="0.7"; tmp[3][1] = "off";
  tmp[4][0]="0.8"; tmp[4][1] = "on";
  tmp[5][0]="0.8"; tmp[5][1] = "off";
  tmp[6][0]="0.9"; tmp[6][1] = "on";
  tmp[7][0]="0.9"; tmp[7][1] = "off";

  for(int i = 0; i < tmp.size(); i++) {
    vector<Param*> tmp_vector;
    for(int j = 0; j < orgSpace->params.size(); j++) {
      Param* tmp_param = new Param(orgSpace->params[j]->name, orgSpace->params[j]->type, orgSpace->params[j]->defVal);
      tmp_param->options = orgSpace->params[j]->options;
      tmp_param->min = orgSpace->params[j]->min;
      tmp_param->max = orgSpace->params[j]->max;
      tmp_vector.push_back(tmp_param);
    }
    
    for(int j = 0; j < tmp_vector.size(); j++) {
      if(tmp_vector[j]->name == "alpha_t") {
        tmp_vector[j]->min = atof(tmp[i][0].c_str())-0.1;
        tmp_vector[j]->max = atof(tmp[i][0].c_str());
      }
      if(tmp_vector[j]->name == "allow_unrelated_clustering") {
        tmp_vector[j]->options.clear();
        tmp_vector[j]->options.push_back(tmp[i][1]);
      }
    }
    
    Space* tmpspace = new Space(tmp_vector,i+1);
    assert(tmpspace != NULL);
    spaceBuf.push_back(tmpspace);
  }
 
  
  for(int i = 0; i < spaceBuf.size(); i++) {
    Space* tmpspace = spaceBuf[i];
    assert(tmpspace != NULL);
    cout<<"debug id "<<tmpspace->id<<endl;
    for(int j = 0; j < tmpspace->params.size(); j++) {
      Param* tmpparam = tmpspace->params[j];
      assert(tmpparam != NULL);
      if(tmpparam->name == "alpha_t") {
        cout<<"debug "<<i<<" "<<tmpparam->min<<" "<<tmpparam->max<<endl;
      }
    }
  }
}*/
