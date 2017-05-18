#include "space_partition.h"
#include <vector>
#include <map>
#include <utility>
#include <cmath>
#include <string>
#include <cstdio>
#include <iostream>
#include <algorithm>
#include <cassert>
#include "structure.h"

using namespace std;
//find minimum space avg value
bool myfunction(pair<int,float> a, pair<int,float> b) {return a.second < b.second;}
//find maximum information gain ratio
bool myfunction1(pair<string,float> a, pair<string,float> b) {return a.second > b.second;}


string getValue(string param_name, Space* orgspace, float orgvalue) {
    Param* orgparam = getParam(orgspace, param_name);
    assert(orgparam->type == "FloatParameter");
    float unit = fabs(orgparam->max - orgparam->min)/4;
    float value = orgvalue;
    int rank = int(ceil(fabs(value-orgparam->min)/unit));
    rank = rank < 1 ? 1: rank;
    rank = rank > 4 ? 4: rank;
    char tmp[10];
    sprintf(tmp,"bin%d",rank);
    return string(tmp);
}

void param_entropy(map<int,vector<Result*> > points, Space* space, Space* orgspace, vector<string>& params){
#ifdef DEBUG_MSG
  printf("debug space id %d is going to be splited, %d data in this space has been searched\n",space->id, points.find(space->id)->second.size());
#endif
  assert(points.count(space->id) > 0);
  int pos_num = 0;
  int neg_num = 0;
  vector<Result*> spaceResults = points.find(space->id)->second;
  float avg_def_value = 0;
  for(int i = 0; i < spaceResults.size(); i++) {
    Result* result = spaceResults[i];
    if(fabs(result->score) != 10000) {
      avg_def_value += result->score;
    }
  }
  assert(spaceResults.size() != 0);
  avg_def_value = avg_def_value / float(spaceResults.size());
#ifdef DEBUG_MSG
  printf("debug avg_def_score %f\n",avg_def_value); 
#endif
  map<string,map<string,vector<int> > > local_buf;
  for(int i = 0; i < spaceResults.size(); i++) {
    Result* result = spaceResults[i];
    assert(result != NULL);
    int label;
    //TODO-modify for effective entropy calculation
    if(result->score > avg_def_value) {
      neg_num++;
      label = 0;
    }
    else {
      pos_num++;
      label = 1;
    }

    for(int j = 0; j < result->name2choice.size(); j++) {
      string param_name = result->name2choice[j].first;
      Param* tmp_param = getParam(space,param_name);
      assert(tmp_param != NULL);
      if(is_single_param(tmp_param,orgspace)) {
        continue;
      }
      //getvalue
      //for enumparameter: original value
      //for floatparameter: ratio/discrimination
      string value = result->name2choice[j].second;
      if(tmp_param->type == "FloatParameter") value = getValue(param_name,orgspace,atof(value.c_str()));
      if(local_buf.count(param_name) > 0) {
        if(local_buf.find(param_name)->second.count(value) > 0) {
          local_buf.find(param_name)->second.find(value)->second.push_back(label);
        }
        else {
          vector<int> tmp_vector;
          tmp_vector.push_back(label);
          local_buf.find(param_name)->second.insert(pair<string,vector<int> >(value,tmp_vector));
        }
      }
      else {
        vector<int> tmp_vector;
        tmp_vector.push_back(label);
        map<string,vector<int> >tmp_map;
        tmp_map.insert(pair<string,vector<int> >(value,tmp_vector));
        local_buf.insert(pair<string,map<string,vector<int> > >(param_name,tmp_map));
      }
    }
  }


  assert(local_buf.size() > 0);
  for(int i = 0; i < space->params.size(); i++) {
    Param* param = space->params[i];
    if(is_single_param(param,orgspace)) continue;
    if(local_buf.count(param->name) <= 0) printf("ERROR %s\n",param->name.c_str());
    assert(local_buf.count(param->name) > 0);
    int count = 0;
    for(map<string,vector<int> >::iterator it = local_buf.find(param->name)->second.begin();
      it != local_buf.find(param->name)->second.end(); it++) {
      count += it->second.size();
    }
    assert(count == spaceResults.size());
  }

  
  float hd = 0.0;
  int total_size = spaceResults.size();
  assert(total_size != 0);
  if(pos_num == 0 || neg_num == 0) hd = 0;
  else hd = -(float(pos_num)/float(total_size))*log2(float(pos_num)/float(total_size))-(float(neg_num)/float(total_size))*log2(float(neg_num)/float(total_size));
#ifdef DEBUG_MSG
  printf("space %d hd: %f, pos_num: %d, neg_num %d\n",space->id,hd,pos_num,neg_num);
#endif
  vector<pair<string,float> >param2hd;
  for(map<string,map<string,vector<int> > >::iterator it = local_buf.begin();
    it != local_buf.end(); it++) {
    float score = 0.0;
    for(map<string,vector<int> >::iterator im = it->second.begin();
      im != it->second.end(); im++) {
      assert(im->second.size() != 0);
      float tmp_factor = float(im->second.size())/float(total_size);
      int tmp_pos = 0;
      int tmp_neg = 0;
      for(int i = 0; i < im->second.size(); i++) {
        if(im->second[i] == 0) tmp_neg++;
        else tmp_pos++;
      }
      assert(tmp_pos+tmp_neg == im->second.size());
      assert(im->second.size() != 0);
      float tmp_hd;
      if(tmp_pos == 0 || tmp_neg == 0) tmp_hd = 0;
      else tmp_hd = -(float(tmp_pos)/float(im->second.size()))*log2(float(tmp_pos)/float(im->second.size()))-(float(tmp_neg)/float(im->second.size()))*log2(float(tmp_neg)/float(im->second.size()));
      score += tmp_factor*tmp_hd;
    }
    pair<string,float> tmp_pair = make_pair(it->first,(hd-score)); //TODO: think about information gain ratio
    param2hd.push_back(tmp_pair);
  }
  sort(param2hd.begin(),param2hd.end(), myfunction1);
  for(int i = 0; i < param2hd.size(); i++) {
    params.push_back(param2hd[i].first);
    //cout<<"check entropy "<<param2hd[i].first<<" "<<param2hd[i].second<<endl;
  }
}

bool is_single_param(Param* param, Space* orgspace) {
  if(param->type == "EnumParameter") {
    if(param->options.size() == 1) return true;
    else return false;
  }
  if(param->type == "FloatParameter") {
    Param* orgparam = getParam(orgspace,param->name);
    assert(orgparam != NULL);
    if(lenRatio(param,orgparam) == 1) return true;
    else return false;
  }
  assert(false);
}

int lenRatio(Param* param, Param* orgparam) {
  assert(param->name == orgparam->name);
  float orglength = fabs(orgparam->max - orgparam->min);
  assert(orglength > 0);
  float currlength = fabs(param->max - param->min);
  float unit = orglength/4;
  int ceil_num = int(ceil(currlength/unit));
  int floor_num = int(floor(currlength/unit));
  int ratio = 0;
  if(fabs(currlength - ceil_num*unit) < fabs(currlength - floor_num*unit)) {
    ratio = ceil_num;
  }
  else ratio = floor_num;
  assert(ratio > 0 && ratio <= 4);
  return ratio;
}

int paramSize(Param* param, Space* orgspace) {
  int size = 0;
  if(param->type == "EnumParameter") size = param->options.size();
  if(param->type == "FloatParameter") {
    Param* orgparam = getParam(orgspace,param->name);
    assert(orgparam != NULL);
    size = lenRatio(param,orgparam);
  }
#ifdef DEBUG_MSG
  printf("param: %s, size: %d\n",param->name.c_str(),size);
#endif
  return size;
}

bool spaceSize(Space* space, Space* orgspace, int size_threshold) {
  int size = 1;
  bool flag = false;
  for(int i = 0; i < space->params.size(); i++) {
    size = size*paramSize(space->params[i],orgspace);   
    if(size > size_threshold) {
      flag = true;
      break;
    }
  }
  return flag;
}
Param* getParam(Space* space, string param_name) {
  for(int i = 0; i < space->params.size(); i++) {
    if(space->params[i]->name == param_name) return space->params[i];
  }
}

void gennewSpace(Space* orgspace, Param* param, int old_space_num, vector<Space*>&newSpaces) {
  //TODO:check for FloatParameter discretize into 4 parts
  int add_size = paramSize(param, orgspace);
  assert(add_size > 1);
  float unit = 0.0;
  if(param->type == "FloatParameter") {
    assert(add_size == 4); //param equals to orgparam
    unit = fabs(param->max-param->min)/4;
  }
  //cout<<"debug add_size "<<add_size<<endl;
  for(int i = 0; i < add_size; i++) {
    vector<Param*> tmp_vector;
    for(int j = 0; j < orgspace->params.size(); j++) {
      Param* tmp_param = new Param(orgspace->params[j]->name, orgspace->params[j]->type, orgspace->params[j]->defVal);
      tmp_param->options = orgspace->params[j]->options;
      tmp_param->min = orgspace->params[j]->min;
      tmp_param->max = orgspace->params[j]->max;
      if(tmp_param->name == param->name) {
        if(param->type == "EnumParameter") {
          tmp_param->options.clear();
          tmp_param->options.push_back(param->options[i]);
          tmp_param->defVal = param->options[i];
        }
        if(param->type == "FloatParameter") {
          tmp_param->min = param->min + i*unit;
          tmp_param->max = tmp_param->min + unit;
          tmp_param->min = tmp_param->min < param->min ? param->min : tmp_param->min;
          tmp_param->max = tmp_param->max > param->max ? param->max : tmp_param->max;
          assert(tmp_param->min < tmp_param->max);
        }
      }
      tmp_vector.push_back(tmp_param);
    }
    Space* tmp_space = new Space(tmp_vector,old_space_num+i+1);
    assert(tmp_space != NULL);
    newSpaces.push_back(tmp_space);
  }
}

void divide_space(int old_max_id, Space* orgspace, map<int,vector<Result*> >& points, map<int,Result*>& space2best, map<int, Space*>& spaceBuf, int& remove_space, int &add_num) {
  int size_threshold = 30;
  //find space to partition
  //TODO: combine both average score and best score
  vector<pair<int,float> > space2perf_vec;
  for(map<int,vector<Result*> >::iterator it = points.begin();
    it != points.end(); it++) {
    float avg_score = 0;
    for(int i = 0; i < it->second.size(); i++) {
      //exception
      if(fabs(it->second[i]->score) != 10000) avg_score += it->second[i]->score;
    }
    assert(it->second.size() != 0);
    avg_score = avg_score/it->second.size();
    pair<int,float> tmp_pair = make_pair(it->first,avg_score);
    space2perf_vec.push_back(tmp_pair);
  }
  sort(space2perf_vec.begin(), space2perf_vec.end(), myfunction);
#ifdef DEBUG_MSG
  for(int i = 0; i < space2perf_vec.size(); i++) {
    printf("Space id: %d, Avg_score: %f\n",space2perf_vec[i].first,space2perf_vec[i].second);
  }
#endif
  

 
  for(int i = 0; i < space2perf_vec.size(); i++) {
    int space_id = space2perf_vec[i].first;
    assert(spaceBuf.count(space_id) > 0);
    Space* space = spaceBuf.find(space_id)->second;
    assert(space != NULL);
    if(!spaceSize(space, orgspace, size_threshold)) continue;;
   
    //calculate information entropy gain
    vector<string> params;
    param_entropy(points,space, orgspace,params);
    for(int j = 0; j < params.size(); j++) {
      string param_name = params[j];
      Param* param = getParam(space,param_name); 
      assert(param != NULL);
      if(!is_single_param(param, orgspace)) {
          //remove old space generate new space
          //only support EnumParameter
        vector<Space*> newSpaces;
        gennewSpace(space,param,old_max_id,newSpaces);
        
        //update
        remove_space = space->id;
        add_num = newSpaces.size();

        //cout<<"[INFO] split space "<<remove_space<<" into "<<add_num<<" spaces based on parameter: "<<param_name<<endl;

        //warning only support enumParameter now
        map<string,int> newvalue2id;
        for(int in = 0; in < newSpaces.size(); in++) {
          Space* tmp_space = newSpaces[in];
          assert(tmp_space != NULL);
          string value;
          for(int it = 0; it < tmp_space->params.size(); it++) {
           if(param_name == tmp_space->params[it]->name) {
              assert(is_single_param(tmp_space->params[it],orgspace));
              if(param->type == "EnumParameter") value = tmp_space->params[it]->options[0];
              if(param->type == "FloatParameter") value = getValue(param_name, orgspace, (tmp_space->params[it]->min + tmp_space->params[it]->max)/2);
              break;
            }
          }
          assert(newvalue2id.count(value) <= 0);
          newvalue2id.insert(pair<string,int>(value,tmp_space->id));
        }

        vector<Result*> old_result = points.find(space->id)->second;
        for(int k = 0; k < old_result.size(); k++) {
          Result* tmp_result = old_result[k];
          assert(tmp_result != NULL);
          int newspace_id = 0;
          for(int tp = 0; tp < tmp_result->name2choice.size(); tp++) {
            if(tmp_result->name2choice[tp].first == param_name) {
              string value = tmp_result->name2choice[tp].second;
              if(param->type == "FloatParameter") value = getValue(param_name,orgspace,atof(value.c_str()));
              assert(newvalue2id.count(value) > 0);
              newspace_id = newvalue2id.find(value)->second;
              break;
            }
          }
          assert(newspace_id != 0);
          //cout<<"debug move from space id "<<space->id<<" to new space "<<newspace_id<<endl;
          if(points.count(newspace_id) > 0) {
            points.find(newspace_id)->second.push_back(tmp_result);
            assert(space2best.count(newspace_id) > 0);
            if(space2best[newspace_id]->score > tmp_result->score) space2best[newspace_id] = tmp_result;
          }
          else {
            vector<Result*> tmp_vector;
            tmp_vector.push_back(tmp_result);
            points.insert(pair<int,vector<Result*> >(newspace_id,tmp_vector));
            assert(space2best.count(newspace_id) <= 0);
            space2best.insert(pair<int,Result*>(newspace_id,tmp_result));
          }
        }
        points.erase(space->id);
        space2best.erase(space->id);
        spaceBuf.erase(space->id);
        for(int k = 0; k < newSpaces.size(); k++) {
          spaceBuf.insert(pair<int,Space*>(newSpaces[k]->id, newSpaces[k])); //Mind new id
        }
        break;
      }
    }
    break;
  }
  //for debug
  for(map<int,vector<Result*> >::iterator it = points.begin(); it != points.end(); it++) {
    int space_id = it->first;
    assert(spaceBuf.count(space_id) > 0);
  }
  return;
}
