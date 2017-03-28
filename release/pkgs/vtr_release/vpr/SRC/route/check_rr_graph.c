#include "util.h"
#include "vpr_types.h"
#include "globals.h"
#include "rr_graph.h"
#include "check_rr_graph.h"

/********************** Local defines and types *****************************/

#define BUF_FLAG 1
#define PTRANS_FLAG 2
#define BUF_AND_PTRANS_FLAG 3

/*********************** Subroutines local to this module *******************/

static boolean rr_node_is_global_clb_ipin(int inode);

static void check_pass_transistors(int from_node);

/************************ Subroutine definitions ****************************/

void check_rr_graph(INP t_graph_type graph_type, INP t_type_ptr types,
		INP int L_nx, INP int L_ny, INP int nodes_per_chan, INP int Fs,
		INP int num_seg_types, INP int num_switches,
		INP t_segment_inf * segment_inf, INP int global_route_switch,
		INP int delayless_switch, INP int wire_to_ipin_switch,
		t_seg_details * seg_details, int **Fc_in, int **Fc_out,
		int *****opin_to_track_map, int *****ipin_to_track_map,
		t_ivec **** track_to_ipin_lookup, t_ivec *** switch_block_conn,
		boolean * perturb_ipins) {

	int *num_edges_from_current_to_node; /* [0..num_rr_nodes-1] */
	int *total_edges_to_node; /* [0..num_rr_nodes-1] */
	char *switch_types_from_current_to_node; /* [0..num_rr_nodes-1] */
	int inode, iedge, to_node, num_edges;
	short switch_type;
	t_rr_type rr_type, to_rr_type;
	enum e_route_type route_type;
	boolean is_fringe_warning_sent;
	t_type_ptr type;

	route_type = DETAILED;
	if (graph_type == GRAPH_GLOBAL) {
		route_type = GLOBAL;
	}

	total_edges_to_node = (int *) my_calloc(num_rr_nodes, sizeof(int));
	num_edges_from_current_to_node = (int *) my_calloc(num_rr_nodes,
			sizeof(int));
	switch_types_from_current_to_node = (char *) my_calloc(num_rr_nodes,
			sizeof(char));

	for (inode = 0; inode < num_rr_nodes; inode++) {
		rr_type = rr_node[inode].type;
		num_edges = rr_node[inode].num_edges;

		check_node(inode, route_type);

		/* Check all the connectivity (edges, etc.) information.                    */

		for (iedge = 0; iedge < num_edges; iedge++) {
			to_node = rr_node[inode].edges[iedge];

			if (to_node < 0 || to_node >= num_rr_nodes) {
				vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: node %d has an edge %d.\n", inode, to_node);
				vpr_printf(TIO_MESSAGE_ERROR, "\tEdge is out of range.\n");
				exit(1);
			}

			num_edges_from_current_to_node[to_node]++;
			total_edges_to_node[to_node]++;

			switch_type = rr_node[inode].switches[iedge];

			if (switch_type < 0 || switch_type >= num_switches) {
				vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: node %d has a switch type %d.\n", inode, switch_type);
				vpr_printf(TIO_MESSAGE_ERROR, "\tSwitch type is out of range.\n");
				exit(1);
			}

			if (switch_inf[switch_type].buffered)
				switch_types_from_current_to_node[to_node] |= BUF_FLAG;
			else
				switch_types_from_current_to_node[to_node] |= PTRANS_FLAG;

		} /* End for all edges of node. */

		for (iedge = 0; iedge < num_edges; iedge++) {
			to_node = rr_node[inode].edges[iedge];

			if (num_edges_from_current_to_node[to_node] > 1) {
				to_rr_type = rr_node[to_node].type;

				if ((to_rr_type != CHANX && to_rr_type != CHANY)
						|| (rr_type != CHANX && rr_type != CHANY)) {
					vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: node %d connects to node %d %d times.\n", 
							inode, to_node, num_edges_from_current_to_node[to_node]);
					exit(1);
				}

				/* Between two wire segments.  Two connections are legal only if  *
				 * one connection is a buffer and the other is a pass transistor. */

				else if (num_edges_from_current_to_node[to_node] != 2 
					 || switch_types_from_current_to_node[to_node] != BUF_AND_PTRANS_FLAG) {
					vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: node %d connects to node %d %d times.\n", 
							inode, to_node, num_edges_from_current_to_node[to_node]);
					exit(1);
				}
			}

			num_edges_from_current_to_node[to_node] = 0;
			switch_types_from_current_to_node[to_node] = 0;
		}

		/* Slow test below.  Leave commented out most of the time. */

#ifdef DEBUG
		check_pass_transistors(inode);
#endif

	} /* End for all rr_nodes */

	/* I built a list of how many edges went to everything in the code above -- *
	 * now I check that everything is reachable.                                */
	is_fringe_warning_sent = FALSE;

	for (inode = 0; inode < num_rr_nodes; inode++) {
		rr_type = rr_node[inode].type;

		if (rr_type != SOURCE) {
			if (total_edges_to_node[inode] < 1
					&& !rr_node_is_global_clb_ipin(inode)) {
				boolean is_fringe;
				boolean is_wire;
				boolean is_chain = FALSE;

				/* A global CLB input pin will not have any edges, and neither will  *
				 * a SOURCE or the start of a carry-chain.  Anything else is an error.                             
				 * For simplicity, carry-chain input pin are entirely ignored in this test				 
				 */

				if(rr_type == IPIN) {
					type = grid[rr_node[inode].xlow][rr_node[inode].ylow].type;
					if(Fc_in[type->index][rr_node[inode].ptc_num] == 0) {
						is_chain = TRUE;
					}
				}

				is_fringe = (boolean)((rr_node[inode].xlow == 1)
						|| (rr_node[inode].ylow == 1)
						|| (rr_node[inode].xhigh == L_nx)
						|| (rr_node[inode].yhigh == L_ny));
				is_wire = (boolean)(rr_node[inode].type == CHANX
						|| rr_node[inode].type == CHANY);

				if (!is_chain && !is_fringe && !is_wire) {
					vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: node %d has no fanin.\n", inode);
					exit(1);
				} else if (!is_chain && !is_fringe_warning_sent) {
					vpr_printf(TIO_MESSAGE_WARNING, "in check_rr_graph: fringe node %d has no fanin.\n", inode);
					vpr_printf(TIO_MESSAGE_WARNING, "\tThis is possible on the fringe for low Fc_out, N, and certain Lengths\n");
					is_fringe_warning_sent = TRUE;
				}
			}
		}

		else { /* SOURCE.  No fanin for now; change if feedthroughs allowed. */
			if (total_edges_to_node[inode] != 0) {
				vpr_printf(TIO_MESSAGE_ERROR, "in check_rr_graph: SOURCE node %d has a fanin of %d, expected 0.\n",
						inode, total_edges_to_node[inode]);
				exit(1);
			}
		}
	}

	free(num_edges_from_current_to_node);
	free(total_edges_to_node);
	free(switch_types_from_current_to_node);
}

static boolean rr_node_is_global_clb_ipin(int inode) {

	/* Returns TRUE if inode refers to a global CLB input pin node.   */

	int ipin;
	t_type_ptr type;

	type = grid[rr_node[inode].xlow][rr_node[inode].ylow].type;

	if (rr_node[inode].type != IPIN)
		return (FALSE);

	ipin = rr_node[inode].ptc_num;

	return (type->is_global_pin[ipin]);
}

void check_node(int inode, enum e_route_type route_type) {

	/* This routine checks that the rr_node is inside the grid and has a valid  
	 * pin number, etc.  
	 */

	int xlow, ylow, xhigh, yhigh, ptc_num, capacity;
	t_rr_type rr_type;
	t_type_ptr type;
	int nodes_per_chan, tracks_per_node, num_edges, cost_index;
	float C, R;

	rr_type = rr_node[inode].type;
	xlow = rr_node[inode].xlow;
	xhigh = rr_node[inode].xhigh;
	ylow = rr_node[inode].ylow;
	yhigh = rr_node[inode].yhigh;
	ptc_num = rr_node[inode].ptc_num;
	capacity = rr_node[inode].capacity;
	type = NULL;

	if (xlow > xhigh || ylow > yhigh) {
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: rr endpoints are (%d,%d) and (%d,%d).\n",
				xlow, ylow, xhigh, yhigh);
		exit(1);
	}

	if (xlow < 0 || xhigh > nx + 1 || ylow < 0 || yhigh > ny + 1) {
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: rr endpoints (%d,%d) and (%d,%d) are out of range.\n", 
				xlow, ylow, xhigh, yhigh);
		exit(1);
	}

	if (ptc_num < 0) {
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a ptc_num of %d.\n",
				inode, rr_type, ptc_num);
		exit(1);
	}

	/* Check that the segment is within the array and such. */

	switch (rr_type) {

	case SOURCE:
	case SINK:
	case IPIN:
	case OPIN:
		/* This is used later as well */
		type = grid[xlow][ylow].type;

		if (type == NULL) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d (type %d) is at an illegal clb location (%d, %d).\n",
					inode, rr_type, xlow, ylow);
			exit(1);
		}
		if (xlow != xhigh || ylow != (yhigh - type->height + 1)) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d (type %d) has endpoints (%d,%d) and (%d,%d)\n", 
					inode, rr_type, xlow, ylow, xhigh, yhigh);
			exit(1);
		}
		break;

	case CHANX:
		if (xlow < 1 || xhigh > nx || yhigh > ny || yhigh != ylow) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: CHANX out of range for endpoints (%d,%d) and (%d,%d)\n", 
					xlow, ylow, xhigh, yhigh);
			exit(1);
		}
		if (route_type == GLOBAL && xlow != xhigh) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d spans multiple channel segments (not allowed for global routing).\n",
					inode);
			exit(1);
		}
		break;

	case CHANY:
		if (xhigh > nx || ylow < 1 || yhigh > ny || xlow != xhigh) {
			vpr_printf(TIO_MESSAGE_ERROR, "Error in check_node: CHANY out of range for endpoints (%d,%d) and (%d,%d)\n", 
					xlow, ylow, xhigh, yhigh);
			exit(1);
		}
		if (route_type == GLOBAL && ylow != yhigh) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d spans multiple channel segments (not allowed for global routing).\n",
					inode);
			exit(1);
		}
		break;

	default:
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: Unexpected segment type: %d\n", rr_type);
		exit(1);
	}

	/* Check that it's capacities and such make sense. */

	switch (rr_type) {

	case SOURCE:

		if (ptc_num >= type->num_class
				|| type->class_inf[ptc_num].type != DRIVER) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a ptc_num of %d.\n", 
					inode, rr_type, ptc_num);
			exit(1);
		}
		if (type->class_inf[ptc_num].num_pins != capacity) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a capacity of %d.\n",
					inode, rr_type, capacity);
			exit(1);
		}

		break;

	case SINK:

		if (ptc_num >= type->num_class
				|| type->class_inf[ptc_num].type != RECEIVER) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a ptc_num of %d.\n", 
					inode, rr_type, ptc_num);
			exit(1);
		}
		if (type->class_inf[ptc_num].num_pins != capacity) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a capacity of %d.\n", 
					inode, rr_type, capacity);
			exit(1);
		}
		break;

	case OPIN:

		if (ptc_num >= type->num_pins
				|| type->class_inf[type->pin_class[ptc_num]].type != DRIVER) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a ptc_num of %d.\n", 
					inode, rr_type, ptc_num);
			exit(1);
		}

		if (capacity != 1) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a capacity of %d.\n", 
					inode, rr_type, capacity);
			exit(1);
		}
		break;

	case IPIN:
		if (ptc_num >= type->num_pins
				|| type->class_inf[type->pin_class[ptc_num]].type != RECEIVER) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) had a ptc_num of %d.\n", 
					   inode, rr_type, ptc_num);
			exit(1);
		}
		if (capacity != 1) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a capacity of %d.\n", 
					inode, rr_type, capacity);
			exit(1);
		}
		break;

	case CHANX:
		if (route_type == DETAILED) {
			nodes_per_chan = chan_width_x[ylow];
			tracks_per_node = 1;
		} else {
			nodes_per_chan = 1;
			tracks_per_node = chan_width_x[ylow];
		}

		if (ptc_num >= nodes_per_chan) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a ptc_num of %d.\n", 
					inode, rr_type, ptc_num);
			exit(1);
		}

		if (capacity != tracks_per_node) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a capacity of %d.\n", 
					inode, rr_type, capacity);
			exit(1);
		}
		break;

	case CHANY:
		if (route_type == DETAILED) {
			nodes_per_chan = chan_width_y[xlow];
			tracks_per_node = 1;
		} else {
			nodes_per_chan = 1;
			tracks_per_node = chan_width_y[xlow];
		}

		if (ptc_num >= nodes_per_chan) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a ptc_num of %d.\n", 
					inode, rr_type, ptc_num);
			exit(1);
		}

		if (capacity != tracks_per_node) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: inode %d (type %d) has a capacity of %d.\n", 
					inode, rr_type, capacity);
			exit(1);
		}
		break;

	default:
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: Unexpected segment type: %d\n", rr_type);
		exit(1);

	}

	/* Check that the number of (out) edges is reasonable. */
	num_edges = rr_node[inode].num_edges;

	if (rr_type != SINK && rr_type != IPIN) {
		if (num_edges <= 0) {
			/* Just a warning, since a very poorly routable rr-graph could have nodes with no edges.  *
			 * If such a node was ever used in a final routing (not just in an rr_graph), other       *
			 * error checks in check_routing will catch it.                                           */ 
			vpr_printf(TIO_MESSAGE_WARNING, "in check_node: node %d has no edges.\n", inode);
		}
	}

	else if (rr_type == SINK) { /* SINK -- remove this check if feedthroughs allowed */
		if (num_edges != 0) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d is a sink, but has %d edges.\n", 
					inode, num_edges);
			exit(1);
		}
	}

	/* Check that the capacitance, resistance and cost_index are reasonable. */

	C = rr_node[inode].C;
	R = rr_node[inode].R;

	if (rr_type == CHANX || rr_type == CHANY) {
		if (C < 0. || R < 0.) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d of type %d has R = %g and C = %g.\n", 
					inode, rr_type, R, C);
			exit(1);
		}
	}

	else {
		if (C != 0. || R != 0.) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d of type %d has R = %g and C = %g.\n", 
					inode, rr_type, R, C);
			exit(1);
		}
	}

	cost_index = rr_node[inode].cost_index;
	if (cost_index < 0 || cost_index >= num_rr_indexed_data) {
		vpr_printf(TIO_MESSAGE_ERROR, "in check_node: node %d cost index (%d) is out of range.\n", 
				inode, cost_index);
		exit(1);
	}
}

static void check_pass_transistors(int from_node) {

	/* This routine checks that all pass transistors in the routing truly are  *
	 * bidirectional.  It may be a slow check, so don't use it all the time.   */

	int from_edge, to_node, to_edge, from_num_edges, to_num_edges;
	t_rr_type from_rr_type, to_rr_type;
	short from_switch_type;
	boolean trans_matched;

	from_rr_type = rr_node[from_node].type;
	if (from_rr_type != CHANX && from_rr_type != CHANY)
		return;

	from_num_edges = rr_node[from_node].num_edges;

	for (from_edge = 0; from_edge < from_num_edges; from_edge++) {
		to_node = rr_node[from_node].edges[from_edge];
		to_rr_type = rr_node[to_node].type;

		if (to_rr_type != CHANX && to_rr_type != CHANY)
			continue;

		from_switch_type = rr_node[from_node].switches[from_edge];

		if (switch_inf[from_switch_type].buffered)
			continue;

		/* We know that we have a pass transitor from from_node to to_node.  Now *
		 * check that there is a corresponding edge from to_node back to         *
		 * from_node.                                                            */

		to_num_edges = rr_node[to_node].num_edges;
		trans_matched = FALSE;

		for (to_edge = 0; to_edge < to_num_edges; to_edge++) {
			if (rr_node[to_node].edges[to_edge] == from_node
					&& rr_node[to_node].switches[to_edge] == from_switch_type) {
				trans_matched = TRUE;
				break;
			}
		}

		if (trans_matched == FALSE) {
			vpr_printf(TIO_MESSAGE_ERROR, "in check_pass_transistors:\n");
			vpr_printf(TIO_MESSAGE_ERROR, "connection from node %d to node %d uses a pass transistor (switch type %d)\n",
					from_node, to_node, from_switch_type);
			vpr_printf(TIO_MESSAGE_ERROR, "but there is no corresponding pass transistor edge in the other direction.\n");
			exit(1);
		}

	} /* End for all from_node edges */
}
