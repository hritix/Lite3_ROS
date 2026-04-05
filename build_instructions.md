# using distrobox

```bash
distrobox enter <your_env>
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

in another terminal (same dir)

```bash
distrobox enter <your_env>
source install/setup.bash
ros2 topic list
```
## the problem with the ubuntu machines in the lab
- conda is activated by default that was causing problems
- even `conda deactivate` didn't solve it (due to PATH variable), so specify the python executable explicity in the colcon build command
- colcon build --symlink-install --cmake-args -DPYTHON_EXECUTABLE=/usr/bin/python3

# using pixi

```bash
git clone https://github.com/hritix/Lite3_ROS
cd Lite3_ROS
pixi shell
source ./activate_ros.sh
colcon build --symlink-install
```


## After the Build

Enter the build directory (parent of src)

```bash
pixi shell
source ./activate_ros.sh
ros2 launch transfer transfer_launch.py
```

in another terminal (same dir)

```bash
pixi shell
source ./activate_ros.sh
ros2 topic list
```
