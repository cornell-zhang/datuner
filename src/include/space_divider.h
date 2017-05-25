#ifndef __SPACE_DIVIDER_H__
#define __SPACE_DIVIDER_H__

#include <map>
#include "structure.h"

void genOrgSpace(Space*& orgSpace, std::string space_file);
void initDivision(Space* orgSpace, std::map<int,Space*>& space_buffer);

#endif
