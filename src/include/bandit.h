#ifndef __BANDIT_H__
#define __BANDIT_H__
#include <vector>
#include <queue>
#include <map>
#include <utility>
#include "structure.h"

class Bandit {
  public:
    
    void cal_rewards(std::map<int,std::vector<Result*> >& points, std::vector<std::pair<int,float> >& reward);
    float bandit_score(int);
    float ucb_score(int index, std::map<int,std::vector<Result*> >& points);
    float exploration_term(int index);
    float exploitation_term(int index);
    float exploitation_ucb(int index, std::map<int,std::vector<Result*> >& points);
    float normalized_score(float,float,float);
    void set_window(int window) {this->window = window;}
    void set_c(float c) {this->c = c;}

    void pop_history();
    void push_history(int index, float score);
    void on_result(int index, float score);
    int update_bandit(int remove, int add_num);
    void check_arms(std::map<int,Space*> space_buffer);
    Bandit(int arms);
    ~Bandit();
  protected:
    float c;
    int window;
    int numofArms;
    float best_reward;
    std::queue<int> history;
    std::queue<int> was_best;
    std::map<int,int> use_counts;
    std::map<int,int> auc_sum;
    std::map<int,int> auc_decay;
};
#endif
