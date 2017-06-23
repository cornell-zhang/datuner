#ifndef __AUTOTUNER_H__
#define __AUTOTUNER_H__
#include "structure.h"
#include <vector>
#include <string>

class AutoTuner{
  public:
    AutoTuner(int task, std::string design, int tune_type, int tune_cst){_task = task; _design = design; _tune_type = tune_type; _tune_cst = tune_cst;}
    ~AutoTuner(){}
    bool callOpenTuner(Task*, std::vector<Result*>&, int rank, std::string path, std::string pycode="");
  protected:
    void param_parse(Task*,int rank);
    void parse_Vivado_result(std::vector<Result*>&, int);
    void parse_VPR_result(std::vector<Result*>&, int);
    void parse_ISE_result(std::vector<Result*>&, int);
    void parse_program_result(std::vector<Result*>&, int);
    int c2py(std::vector<Result*>&, int rank, std::string pycode="");
    int _step;
    int _task;
    int _tune_type;
    int _tune_cst;
    std::string _design;
    std::string _path;
};

#endif
