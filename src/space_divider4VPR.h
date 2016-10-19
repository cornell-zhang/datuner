#ifndef __SPACE_DIVIDER_H__
#define __SPACE_DIVIDER_H__

#include "structure.h"
#include <vector>
#include <map>

void initDivision_VPR(Space* orgSpace, std::map<int,Space*>&spaceBuf);
void initDivision8_VPR(Space* orgSpace, std::map<int,Space*>& spaceBuf);
void genOrgSpace4VPR(Space*& orgSpace);
void spaceDivision4VPR(Space* orgSpace, std::vector<Space*>& spaceBuf, int);


#endif
