/**
 * Copyright(c) 2012 Peking University
 *
 * Author(s): Guojie Luo (gluo@pku.edu.cn)
 *
 * Description: Stopwatch
 *
 * Created: 2012/10/18 by Guojie Luo
 * Updated: 2012/11/28 by Guojie Luo
 */

#include <assert.h>
#include <stdio.h>
#include "stopwatch.h"

///////////////////////////////////////////////////////////////////////////////

void init(struct Stopwatch* timer, clockid_t clk_id) {
  timer->clk_id_ = clk_id;
  reset(timer);
}

void tick(struct Stopwatch* timer) {
  if (timer->state_ != Stopwatch::TICKING) {
    timer->state_ = Stopwatch::TICKING;
    ++ timer->num_calls;
    clock_gettime(timer->clk_id_, &timer->start_);
  } else assert(0);
}

void stop(struct Stopwatch* timer) {
  if (timer->state_ != Stopwatch::STOPPED) {
    timer->state_ = Stopwatch::STOPPED;
    struct timespec current;
    clock_gettime(timer->clk_id_, &current);
    timer->count_.tv_sec += current.tv_sec - timer->start_.tv_sec;
    timer->count_.tv_nsec += current.tv_nsec - timer->start_.tv_nsec;
  } else assert(0);
}

void reset(struct Stopwatch* timer) {
  timer->count_.tv_sec = 0;
  timer->count_.tv_nsec = 0;
  timer->state_ = Stopwatch::STOPPED;
  timer->num_calls = 0;
}

double seconds(struct Stopwatch* timer) {
  if (timer->state_ == Stopwatch::STOPPED) {
    return timer->count_.tv_sec + 1e-9 * timer->count_.tv_nsec;
  } else {
    struct timespec current;
    clock_gettime(timer->clk_id_, &current);
    long delta_sec  = current.tv_sec - timer->start_.tv_sec;
    long delta_nsec = current.tv_nsec - timer->start_.tv_nsec;
    return (timer->count_.tv_sec + delta_sec)
      + 1e-9 * (timer->count_.tv_nsec + delta_nsec);
  }
}

///////////////////////////////////////////////////////////////////////////////

double get_vsize() {
  char buf[1000];

  FILE* file = fopen("/proc/self/stat", "r");
  for (int i = 0; i < 23; ++i)
    fscanf(file, "%s", buf);
  fclose(file);

  double vsize;
  sscanf(buf, "%lf", &vsize);
  return (1.0/(1024.*1024.)) * vsize;
}

///////////////////////////////////////////////////////////////////////////////
