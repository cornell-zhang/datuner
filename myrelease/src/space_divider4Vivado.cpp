#include <iostream>
#include <vector>
#include <cassert>
#include "space_divider4Vivado.h"
#include "structure.h"
#include <cstdio>
#include <cstdlib>
#include <cmath>

using namespace std;

void genOrgSpace4Vivado(Space*& orgSpace,double tcst_default) {
  vector<Param*> params;
  Param* tmp = new Param("Optdirective","EnumParameter","Default");
  tmp->options.push_back("Explore");
  tmp->options.push_back("ExploreSequentialArea");
  tmp->options.push_back("AddRemap");
  tmp->options.push_back("ExploreArea");
  tmp->options.push_back("Default");
  params.push_back(tmp);

  tmp = new Param("Placedirective","EnumParameter","Default");
  tmp->options.push_back("Explore");
  tmp->options.push_back("ExtraNetDelay_high");
  tmp->options.push_back("ExtraNetDelay_medium");
  tmp->options.push_back("ExtraNetDelay_low");
  tmp->options.push_back("ExtraPostPlacementOpt");
  tmp->options.push_back("WLDrivenBlockPlacement");
  tmp->options.push_back("LateBlockPlacement");
  tmp->options.push_back("SSI_SpreadLogic_high");
  tmp->options.push_back("SSI_SpreadLogic_low");
  tmp->options.push_back("ExtraTimingOpt");
  tmp->options.push_back("AltSpreadLogic_low");
  tmp->options.push_back("AltSpreadLogic_medium");
  tmp->options.push_back("AltSpreadLogic_high");
  tmp->options.push_back("Default");
  params.push_back(tmp);

  tmp = new Param("fanout_opt","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("placement_opt","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("critical_cell_opt","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("critical_pin_opt","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("retime","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("rewire","EnumParameter","on");
  tmp->options.push_back("on");
  tmp->options.push_back("off");
  params.push_back(tmp);

  tmp = new Param("Routedirective","EnumParameter","Default");
  tmp->options.push_back("Explore");
  tmp->options.push_back("HigherDelayCost");
  tmp->options.push_back("Default");
  params.push_back(tmp);


  if(fabs(tcst_default-0.0) > 0.0001) { 
    char tmp_default[10];
    sprintf(tmp_default,"%f",tcst_default);
    tmp = new Param("Timingcst","FloatParameter",string(tmp_default));
    tmp->min = tcst_default*0.9;
    tmp->max = tcst_default*1.2;
    params.push_back(tmp);
  }

  orgSpace = new Space(params,0);
  assert(orgSpace != NULL);
  /*
  for(int i = 0; i < orgSpace->params.size(); i++) {
    //cout<<orgSpace->params[i]->name<<endl;
    printf("%s,%s\n",orgSpace->params[i]->name, orgSpace->params[i]->type);
  }*/
}

void initDivision(Space* orgSpace, map<int,Space*>& spaceBuf) {
  Space* subspace = new Space(orgSpace->params,1);
  assert(subspace != NULL);
  spaceBuf.insert(pair<int,Space*>(1,subspace));
}


void initDivision2(Space* orgSpace, map<int,Space*>& spaceBuf) {
  int subspace = 2;
  for(int i = 0; i < subspace; i++) {
    vector<Param*> tmp_vector;
    for(int j = 0; j < orgSpace->params.size(); j++) {
      Param* tmp_param = new Param(orgSpace->params[j]->name, orgSpace->params[j]->type, orgSpace->params[j]->defVal);
      tmp_param->options = orgSpace->params[j]->options;
      tmp_param->min = orgSpace->params[j]->min;
      tmp_param->max = orgSpace->params[j]->max;
      if(tmp_param->name == "retime") {
        tmp_param->options.clear();
        string value;
        if(i == 0) value = "on";
        else value = "off";
        tmp_param->options.push_back(value);
        tmp_param->defVal = value;
      }
      tmp_vector.push_back(tmp_param);
    }
    Space* tmpspace = new Space(tmp_vector,i+1); //space start from 1
    assert(tmpspace != NULL);
    spaceBuf.insert(pair<int,Space*>(tmpspace->id,tmpspace));
  }
}

void initDivision8_Vivado(Space* orgSpace, map<int,Space*>&spaceBuf) {
  int snum = 8;
  spaceBuf.clear();
  vector<vector<string> > tmp;
  tmp.resize(snum);
  tmp[0].push_back("on"); tmp[0].push_back("on"); tmp[0].push_back("on");
  tmp[1].push_back("on"); tmp[1].push_back("on"); tmp[1].push_back("off");
  tmp[2].push_back("on"); tmp[2].push_back("off"); tmp[2].push_back("on");
  tmp[3].push_back("on"); tmp[3].push_back("off"); tmp[3].push_back("off");
  tmp[4].push_back("off"); tmp[4].push_back("on"); tmp[4].push_back("on");
  tmp[5].push_back("off"); tmp[5].push_back("on"); tmp[5].push_back("off");
  tmp[6].push_back("off"); tmp[6].push_back("off"); tmp[6].push_back("on");
  tmp[7].push_back("off"); tmp[7].push_back("off"); tmp[7].push_back("off");


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
      if(tmp_vector[j]->name == "retime") {
        tmp_vector[j]->options.clear();
        tmp_vector[j]->options.push_back(tmp[i][0]);
        tmp_vector[j]->defVal = tmp[i][0];
      }
      if(tmp_vector[j]->name == "rewire") {
        tmp_vector[j]->options.clear();
        tmp_vector[j]->options.push_back(tmp[i][1]);
        tmp_vector[j]->defVal = tmp[i][1];
      }
      if(tmp_vector[j]->name == "placement_opt") {
        tmp_vector[j]->options.clear();
        tmp_vector[j]->options.push_back(tmp[i][2]);
        tmp_vector[j]->defVal = tmp[i][2];
      }
    }
    
    Space* tmpspace = new Space(tmp_vector,i+1); //space start from 1
    assert(tmpspace != NULL);
    spaceBuf.insert(pair<int,Space*> (i+1,tmpspace));
  }
}
