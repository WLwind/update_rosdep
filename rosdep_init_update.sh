#!/bin/bash -e
if [ ! -d "/etc/ros/rosdep/sources.list.d/" ];then
  sudo mkdir -p /etc/ros/rosdep/sources.list.d
fi
sudo cp 20-default.list /etc/ros/rosdep/sources.list.d/
sudo cp {osx-homebrew.yaml,base.yaml,python.yaml,ruby.yaml,index-v4.yaml} /etc/ros/rosdep/
sudo cp -r {foxy,galactic,melodic,noetic,rolling} /etc/ros/rosdep/
sudo sed -i "s/'https:\/\/raw.githubusercontent.com\/ros\/rosdistro\/master\/index-v4.yaml'/'file:\/\/\/etc\/ros\/rosdep\/index-v4.yaml'/g" /usr/lib/python2.7/dist-packages/rosdistro/__init__.py
rosdep update
