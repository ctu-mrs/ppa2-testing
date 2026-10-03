#!/bin/bash

echo "$0: Removing MRS ROS2 Testing PPA repository"

sudo rm /etc/apt/sources.list.d/ctu-mrs-testing.list
sudo rm /etc/apt/preferences.d/ctu-mrs-testing-preferences
sudo rm /etc/ros/rosdep/sources.list.d/ctu-mrs-testing.list

if [ -n "$ROS_DISTRO" ]; then
  DISTRO="--rosdistro=$ROS_DISTRO"
fi

sudo apt-get -o Acquire::Retries=4 update
rosdep $DISTRO update

echo "$0: Finished removing MRS ROS2 Testing PPA repository"
