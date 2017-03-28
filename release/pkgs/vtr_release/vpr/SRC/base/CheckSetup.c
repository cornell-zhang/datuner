#include "util.h"
#include "vpr_types.h"
#include "globals.h"
#include "OptionTokens.h"
#include "ReadOptions.h"
#include "read_xml_arch_file.h"
#include "SetupVPR.h"

void CheckSetup(INP enum e_operation Operation,
		INP struct s_placer_opts PlacerOpts,
		INP struct s_annealing_sched AnnealSched,
		INP struct s_router_opts RouterOpts,
		INP struct s_det_routing_arch RoutingArch, INP t_segment_inf * Segments,
		INP t_timing_inf Timing, INP t_chan_width_dist Chans) {
	int i;
	int Tmp;

	if ((GLOBAL == RouterOpts.route_type)
			&& (TIMING_DRIVEN == RouterOpts.router_algorithm)) {

		vpr_printf(TIO_MESSAGE_ERROR, "The global router does not support timing-drvien routing.\n");
		exit(1);
	}

	if ((GLOBAL == RouterOpts.route_type)
			&& (BOUNDING_BOX_PLACE != PlacerOpts.place_algorithm)) {

		/* Works, but very weird.  Can't optimize timing well, since you're
		 * not doing proper architecture delay modelling. */
		vpr_printf(TIO_MESSAGE_WARNING, "Using global routing with timing-driven placement. "
				   "This is allowed, but strange, and circuit speed will suffer.\n");
	}

	if ((FALSE == Timing.timing_analysis_enabled)
			&& ((PlacerOpts.place_algorithm == NET_TIMING_DRIVEN_PLACE)
					|| (PlacerOpts.place_algorithm == PATH_TIMING_DRIVEN_PLACE))) {

		/* May work, not tested */
		vpr_printf(TIO_MESSAGE_ERROR, "Timing analysis must be enabled for timing-driven placement.\n");
		exit(1);
	}

	if (!PlacerOpts.doPlacement && (USER == PlacerOpts.pad_loc_type)) {
		vpr_printf(TIO_MESSAGE_ERROR, "A pad location file requires that placement is enabled.\n");
		exit(1);
	}

	if (RouterOpts.doRouting) {
		if ((TIMING_DRIVEN == RouterOpts.router_algorithm)
				&& (FALSE == Timing.timing_analysis_enabled)) {
			vpr_printf(TIO_MESSAGE_ERROR, "Cannot perform timing-driven routing when timing analysis is disabled.\n");
			exit(1);
		}

		if ((FALSE == Timing.timing_analysis_enabled)
				&& (DEMAND_ONLY != RouterOpts.base_cost_type)) {
			vpr_printf(TIO_MESSAGE_ERROR, "base_cost_type must be demand_only when timing analysis is disabled.\n");
			exit(1);
		}
	}

	if ((TIMING_ANALYSIS_ONLY == Operation)
			&& (FALSE == Timing.timing_analysis_enabled)) {
		vpr_printf(TIO_MESSAGE_ERROR, "-timing_analyze_only_with_net_delay option requires that timing analysis not be disabled.\n");
		exit(1);
	}

	if (DETAILED == RouterOpts.route_type) {
		if ((Chans.chan_x_dist.type != UNIFORM)
				|| (Chans.chan_y_dist.type != UNIFORM)
				|| (Chans.chan_x_dist.peak != Chans.chan_y_dist.peak)
				|| (Chans.chan_x_dist.peak != Chans.chan_width_io)) {
			vpr_printf(TIO_MESSAGE_ERROR, "Detailed routing currently only supported on FPGAs with all channels of equal width.\n");
			exit(1);
		}
	}

	for (i = 0; i < RoutingArch.num_segment; ++i) {
		Tmp = Segments[i].opin_switch;
		if (FALSE == switch_inf[Tmp].buffered) {
			vpr_printf(TIO_MESSAGE_ERROR, "opin_switch (#%d) of segment type #%d is not buffered.\n", Tmp, i);
			exit(1);
		}
	}

	if (UNI_DIRECTIONAL == RoutingArch.directionality) {
		if ((RouterOpts.fixed_channel_width != NO_FIXED_CHANNEL_WIDTH)
				&& (RouterOpts.fixed_channel_width % 2 > 0)) {
			vpr_printf(TIO_MESSAGE_ERROR, "Routing channel width must be even for unidirectional.\n");
			exit(1);
		}
		if ((PlacerOpts.place_chan_width != NO_FIXED_CHANNEL_WIDTH)
				&& (PlacerOpts.place_chan_width % 2 > 0)) {
			vpr_printf(TIO_MESSAGE_ERROR, "Place channel width must be even for unidirectional.\n");
			exit(1);
		}
	}
}
