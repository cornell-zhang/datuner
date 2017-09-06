#ifndef __SPACE_GENERATOR_H__
#define __SPACE_GENERATOR_H__

#include <map>
#include "structure.h"

void genOrgSpace(Space*& orgSpace, std::string space_file, int &search_space_size);
void initDivision(Space* orgSpace, std::map<int,Space*>& space_buffer);

#endif
