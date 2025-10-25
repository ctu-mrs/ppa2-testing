#!/bin/bash

echo "$0: Removing MRS ROS2 Testing PPA repository"

sudo rm /etc/apt/sources.list.d/ctu-mrs-testing.list
sudo rm /etc/apt/preferences.d/ctu-mrs-testing-preferences
sudo rm /etc/ros/rosdep/sources.list.d/ctu-mrs-testing.list

sudo apt-get -y update
rosdep update

echo "$0: Finished removing MRS ROS2 Testing PPA repository"
