#! /bin/sh

current_dir="$HOME/.config/catkin_workspace"
current_dir="`( cd \"$current_dir\" && pwd )`"  # absolutized and normalized
catkin_workspaces_file="$current_dir""/catkin_workspaces"
catkin_workspaces=`cat $catkin_workspaces_file`
chosen_workspace=$(echo "$catkin_workspaces" | rofi -dmenu -i -fn "Monospace-13" -p "Which catkin_workspace?")
if [ "$chosen_workspace" = "" ] 
then
    exit 1
fi
chosen_catkin_workspace_file="$current_dir""/chosen_catkin_workspace"
echo "$chosen_workspace" > $chosen_catkin_workspace_file
echo "Chosen catkin workspace: ""$chosen_workspace"
echo "####################################"
echo "# Please execute \`source ~/.zshrc\` #"
echo "####################################"
