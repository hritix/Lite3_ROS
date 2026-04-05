# using distrobox

```bash
  source /opt/ros/foxy/setup.bash
  sudo rosdep init
  rosdep update
  rosdep install --from-paths src --ignore-src -y
  colcon build --symlink-install
```

At this point build is completed may get some warnings but that's fine
```bash
source install/setup.bash
# ensure that you are on the same network as the robot, and feed your ip in there or something
ros2 launch transfer transfer_launch.py
```
## the problem with the ubuntu machines in the lab
- conda is activated by default that was causing problems
- even `conda deactivate` didn't solve it (due to PATH variable), so specify the python executable explicity in the colcon build command
- colcon build --symlink-install --cmake-args -DPYTHON_EXECUTABLE=/usr/bin/python3

# using pixi

```bash
git clone https://github.com/hritix/Lite3_ROS
cd Lite3_ROS
pixi init --channel robostack --channel conda-forge
pixi add python=3.8
pixi add \
  compilers cmake pkg-config colcon-common-extensions \
  "empy<4.0" catkin_pkg lark \
  ros-foxy-ros-base \
  ros-foxy-rmw-fastrtps-cpp \
  ros-foxy-rclcpp \
  ros-foxy-sensor-msgs \
  ros-foxy-nav-msgs \
  ros-foxy-geometry-msgs \
  ros-foxy-tf2-ros \
  ros-foxy-tf2-geometry-msgs \
  ros-foxy-rosidl-default-generators \
  ros-foxy-rosidl-default-runtime \
  ros-foxy-ament-cmake \
  libxcrypt \
  foonathan-memory \
  ros-foxy-foonathan-memory-vendor

# Enter the pixi environment
pixi shell
# 2. Tell ROS/CMake where the Pixi packages live
export AMENT_PREFIX_PATH=$PWD/.pixi/envs/default
export CMAKE_PREFIX_PATH=$PWD/.pixi/envs/default
export COLCON_PREFIX_PATH=$PWD/.pixi/envs/default
colcon build --symlink-install
```


# After the Build

Enter the build directory (parent of src)

```bash
pixi shell
source install/setup.bash
ros2 launch transfer transfer_launch.py
```

in another terminal (same dir)

```bash
pixi shell
source install/setup.bash
ros2 topic list
```

