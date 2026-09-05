#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding MRS ROS2 Testing PPA repository"

sudo apt-get --no-install-recommends -o Acquire::Retries=4 -y install curl gpg dpkg-dev python3-rosdep

if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
  sudo rosdep init
fi

if [ -n "$ROS_DISTRO" ]; then
  DISTRO="--rosdistro=$ROS_DISTRO"
fi

ARCH=$(dpkg-architecture -qDEB_HOST_ARCH)
sudo curl -s --compressed --retry 4 --retry-all-errors -o /etc/ros/rosdep/sources.list.d/ctu-mrs-testing.list "https://ctu-mrs.github.io/ppa2-testing/ctu-mrs-$ARCH.list"
curl -s --compressed --retry 4 --retry-all-errors https://ctu-mrs.github.io/ppa2-testing/add_sources_ppa.sh | bash
rosdep $DISTRO update

echo "$0: Finished adding MRS ROS2 Testing PPA repository"
