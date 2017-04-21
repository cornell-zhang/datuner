#ifndef __SPACE_DIVIDER_ISE_H__
#define __SPACE_DIVIDER_ISE_H__

#include "structure.h"
#include <vector>
#include <map>

void initDivision_ISE(Space* orgSpace, std::map<int,Space*>&spaceBuf);
void genOrgSpace4ISE(Space*& orgSpace);


#endif
