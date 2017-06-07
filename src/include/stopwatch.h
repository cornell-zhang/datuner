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

#ifndef STOPWATCH__H
#define STOPWATCH__H

extern "C" {
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <time.h>
}

struct Stopwatch {
  /* clk_id in {
   *   CLOCK_REALTIME,
   *   CLOCK_PROCESS_CPUTIME_ID,
   *   CLOCK_THREAD_CPUTIME_ID
   * }
   */
  clockid_t clk_id_;
  struct timespec start_;
  struct timespec count_;
  enum { TICKING, STOPPED } state_;
  int num_calls;
};

void init(struct Stopwatch* timer, clockid_t clk_id);
void reset(struct Stopwatch* timer);
void tick(struct Stopwatch* timer);
void stop(struct Stopwatch* timer);
double seconds(struct Stopwatch* timer);

// virtual memory size in megabytes (MB)
double get_vsize();

#endif
