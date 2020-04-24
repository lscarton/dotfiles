wsNum="$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')"
# echo $wsNum
left=$(($wsNum - 1))
right=$(($wsNum + 1))
if [ $left -eq 0 ]
then
    left=1
fi
if [ $right -eq 11 ]
then
    right=10
fi
# echo $left
# echo $right

if [ "$1" = "l" ]
then
    ws=$left
else
    ws=$right
fi
# echo $ws
ws_name="workspace "$ws
# echo $ws_name
i3-msg $ws_name
