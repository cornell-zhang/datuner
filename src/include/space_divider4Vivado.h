#ifndef __SPACE_DIVIDER4VIVADO_H__
#define __SPACE_DIVIDER4VIVADO_H__

#include "structure.h"
#include <vector>
#include <map>

void initDivision8_Vivado(Space* orgSpace, std::map<int,Space*>&spaceBuf);
void initDivision2(Space* orgSpace, std::map<int,Space*>&spaceBuf);
void initDivision(Space* orgSpace, std::map<int,Space*>&spaceBuf);
void genOrgSpace4Vivado(Space*& orgSpace,double);


#endif
