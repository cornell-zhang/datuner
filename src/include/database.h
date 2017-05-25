#ifndef __DATABASE_H__
#define __DATABASE_H__

#include "sqlite3.h"
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>
#include <map>
#include <climits>
#include <unistd.h>
#include "structure.h"

class DataBase {
  public:
    DataBase(std::string path);
    ~DataBase();
    bool OpenDB();
    bool CreateTable(Space* cspace);
    bool SaveResults(Space* cspace, std::vector<Result*>, int id);
    bool CloseDB();
  protected:
    sqlite3* pDB_;
    std::string path_;


};

DataBase::DataBase(std::string path) {
  pDB_ = NULL;
  char hostname[HOST_NAME_MAX];
  gethostname(hostname, HOST_NAME_MAX);
  path_ = path+"/"+std::string(hostname)+".db";
}
DataBase::~DataBase(){}
bool DataBase::OpenDB() {
  int nRes = sqlite3_open(path_.c_str(), &pDB_);
  if(nRes != SQLITE_OK) {
    printf("open database fail\n");
    return false;
  }
    return true;
}
bool DataBase::CreateTable(Space* cspace){
  if(!pDB_) printf("null db pointer\n");
  assert(pDB_);
  char* cErrMsg;
  std::string cSql = "CREATE TABLE IF NOT EXISTS result (id integer PRIMARY KEY,";
  Space* space = cspace;
  for(int i = 0; i < space->params.size(); i++) {
    Param* param = space->params[i];
    assert(param != NULL);
    cSql += param->name+" text NOT NULL,";
  }
  cSql += "qor float NOT NULL);";
  int nRes = sqlite3_exec(pDB_,cSql.c_str(),0,0,&cErrMsg);
  if(nRes != SQLITE_OK) {
    printf("create table fail\n");
    return false;
  }
  return true;
}
bool DataBase::SaveResults(Space* cspace, std::vector<Result*> results, int id) {
  if(results.size() == 0) return true;
  assert(pDB_);
  char* cErrMsg;
  Space* space = cspace;
  assert(space != NULL);
  std::string cSql = "INSERT INTO result ";
  //std::string cSql = "INSERT INTO result (id, ";
  //for(int i = 0; i < space->params.size(); i++) {
  //  Param* param = space->params[i];
  //  assert(param != NULL);
  //  cSql += param->name+" , ";
  //};
  //cSql += "qor) VALUES";
  cSql += " VALUES ";
  char buf[50];
  for(int i = 0; i < results.size(); i++) {
    sprintf(buf,"%d",id+1+i);
    cSql += "("+std::string(buf)+",";
    std::map<std::string,std::string> tname2choice;
    for(int j = 0; j < results[i]->name2choice.size(); j++) {
      tname2choice.insert(results[i]->name2choice[j]);
    }
    for(int j = 0; j < space->params.size(); j++) {
      Param* param = space->params[j];
      assert(tname2choice.count(param->name) > 0);
      std::string value = tname2choice.find(param->name)->second;
      cSql += "\""+value+"\",";
    }
    sprintf(buf,"%f",results[i]->score);
    cSql += std::string(buf)+")";
    if(i < results.size()-1) cSql += ", ";
    else cSql += ";";
  }
  int nRes = sqlite3_exec(pDB_, cSql.c_str(), 0,0,&cErrMsg);
  if(nRes != SQLITE_OK) {
    printf("insert value fail\n");
    return false;
  }
  return true;
}
bool DataBase::CloseDB(){
  int nRes = sqlite3_close(pDB_);
  if(nRes != SQLITE_OK) {
    printf("close db fail\n");
    return false;
  }         
  return true;
}
#endif
