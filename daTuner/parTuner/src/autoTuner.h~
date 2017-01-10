#ifndef __AUTOTUNER_H__
#define __AUTOTUNER_H__
#include "structure.h"
#include <vector>
#include <string>

class AutoTuner{
  public:
    AutoTuner(int task, std::string design, int tune_type, int exp_type){_task = task; _design = design; _tune_type = tune_type; _exp_type = exp_type;}
    ~AutoTuner(){}
    bool callOpenTuner(Task*, std::vector<Result*>&, int rank);
  protected:
    void param_parse(Task*,int rank);
    int c2py(int argc, char** argv);
    void parse_Vivado_result(std::vector<Result*>&, int);
    void parse_VPR_result(std::vector<Result*>&, int);
    void parse_ISE_result(std::vector<Result*>&, int);
    int c2py2(std::vector<Result*>&, int rank);
    int _step;
    int _task;
    int _tune_type;
    int _exp_type;
    std::string _design;
    std::string _path;
};

#endif
