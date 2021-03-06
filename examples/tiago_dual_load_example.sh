#!/bin/bash

# Unload curernt arm controllers for the ur5 bimanual stand and replace them for joint_group_ff_controllers/JointGroupVelocityFFController

# Upload controllers parameters on server
rosparam load $(rospack find joint_group_ff_controllers)/examples/tiago_dual_example_config.yaml

# Stop and unload default tiago dual controller
rosrun controller_manager controller_manager stop arm_left_controller arm_right_controller
rosrun controller_manager controller_manager unload arm_left_controller arm_right_controller

# Load and run new joint_group_ff_controllers/JointGroupVelocityFFController controlles
rosrun controller_manager controller_manager spawn arm_left_controller arm_right_controller