# format diff
alias formatploxstaged="git diff --name-only --staged | grep -E '\.(h|cpp)$' | xargs -r clang-format-8 -i -style=file $1; git diff --name-only --staged | grep -E '\.(py)$' | xargs -r autopep8 -i"
# source ros
alias ros="source /opt/ros/melodic/setup.bash"
# source ros2
alias rostwo="source /opt/ros/dashing/setup.bash; export CC=clang; export CXX=clang++;"
# workaround for bspwm
alias clion="wmname LG3D && bash ~/clion/CLion-2020.2.1/clion-2020.2.1/bin/clion.sh"
alias rescan="sudo iwlist ${INTERFACE} scan"
