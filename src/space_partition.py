import math
import copy

def check_design_point_in_space(design_point, target_space):
# return true if 'design_point' lies within 'target_space'
  for i in design_point[0]:
    for j in target_space:
      if i[0] == j[1]:
        if j[0] == 'EnumParameter':
          if (not i[1] in j[2]):
            return False
          else:
            break
  return True


def calculate_conditional_entropy(target_space, dimension, average_qor, \
                                      global_result):
# calculate the conditional entropy assuming partitioning along 'dimension' 
  conditional_entropy = 0
  # values store all possible values for the parameter in 'dimension'
  values = dimension[2]

  for value in values:
    # for each value of dimension, formulate a subspace with the specific 
    # value, used to check whether a design point lies in the proposed subspace
    target_subspace = copy.deepcopy(target_space)
    for i in target_subspace:
      if i[1] == dimension[1]:
        i[2] = [value]
        break

    # evaluate design points in target_subspace
    num_pts, num_good_pts, num_bad_pts = 0, 0, 0
    for design_point in global_result:
      if check_design_point_in_space(design_point, target_subspace):
        num_pts += 1
        if design_point[-1] <= average_qor: 
          num_good_pts += 1
        else: 
          num_bad_pts += 1

    # an empty set of points does not contribute to entropy
    if num_pts == 0:
      continue
    num_pts, num_good_pts, num_bad_pts =  \
      map(float, [num_pts, num_good_pts, num_bad_pts])
    # calculate the entropy of target_subspace
    entropy_good_pts, entropy_bad_pts = 0, 0
    if num_good_pts > 0:
      entropy_good_pts = -(num_good_pts/num_pts*math.log(num_good_pts/num_pts))
    if num_bad_pts > 0:
      entropy_bad_pts = -(num_bad_pts/num_pts*math.log(num_bad_pts/num_pts))
    target_subspace_entropy = entropy_good_pts + entropy_bad_pts
    # accumulate to the overall coonditional_entropy, omitting normalization
    # since |D_i| is the same for all partitions
    conditional_entropy += num_pts * target_subspace_entropy

  return conditional_entropy    

def select_dimension(target_space, global_result):
# return the dimension with the largest information gain
  sum_qor = 0
  for i in global_result:
    sum_qor += i[-1]
  average_qor = float(sum_qor) / len(global_result)

  best_conditional_entropy = 1e9
  for dimension in target_space:
    conditional_entropy = \
        calculate_conditional_entropy(target_space, dimension, average_qor, \
                                        global_result)
    if conditional_entropy < best_conditional_entropy:
      best_conditional_entropy = conditional_entropy
      target_dimension = dimension[1]

  return target_dimension


def partition_space(subspaces, global_result):
  # select the subspace with the highest score to partition
  best_score = -1e9
  for space_tuple in subspaces:
    if space_tuple[1] > best_score:
      target_space, best_score, target_freq = space_tuple
      target_space_tuple = space_tuple

  dimension_to_partition = select_dimension(target_space, global_result)

  for dimension in target_space:
    if dimension[1] == dimension_to_partition:
      values = dimension[2]
      break

  # for each value of 'dimension', create a subspace and add to subspaces
  for value in values:
    target_space_copy = copy.deepcopy(target_space)
    for dimension in target_space_copy:
      if dimension[1] == dimension_to_partition:
        dimension[2] = [value]
        break
    subspaces.append([target_space_copy, 0, target_freq])

  # remove the original target_space
  subspaces.remove(target_space_tuple)


def update_score(t, subspaces, global_result):
  for space_tuple in subspaces:
    num_points, total_qor = 0, 0
    for design_point in global_result:
      if check_design_point_in_space(design_point, space_tuple[0]):
        num_points += 1
        total_qor += -design_point[1]
    if num_points == 0:
      space_tuple[1] = math.sqrt(2*math.log(t)/space_tuple[2])
    else:
      space_tuple[1] = total_qor / num_points \
                        + math.sqrt(2*math.log(t)/space_tuple[2])


def select_space(t, subspaces, global_result):
  update_score(t, subspaces, global_result)
  best_score = -1e9
  for space_tuple in subspaces:
    if space_tuple[1] > best_score:
      best_space, best_score = space_tuple[0], space_tuple[1]
      best_space_tuple = space_tuple
  best_space_tuple[2] += 1
  return best_space

def select_space_for_sweep(t, space):
  selected_space = copy.deepcopy(space)
  print(t)
  print str(space)
  selected_space[len(space) - 1][2] = [space[len(space) - 1][2][t-1]]
  return selected_space