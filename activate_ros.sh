#!/bin/bash

# Point ROS to the Pixi hidden packages (fixes 'zero middlewares' and CMake finding errors)
export AMENT_PREFIX_PATH=$PWD/.pixi/envs/default
export CMAKE_PREFIX_PATH=$PWD/.pixi/envs/default
export COLCON_PREFIX_PATH=$PWD/.pixi/envs/default

# Tell the C++ loader where to find the FastRTPS network drivers
export LD_LIBRARY_PATH=$PWD/.pixi/envs/default/lib:$LD_LIBRARY_PATH

# Automatically source the local robot workspace if it has been built
if [ -f "$PWD/install/local_setup.bash" ]; then
    source "$PWD/install/local_setup.bash"
fi

echo "[Pixi] ROS 2 Foxy Environment Activated!"
