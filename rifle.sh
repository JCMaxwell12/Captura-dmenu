# read config file


# set variables


# program
## identify available screens
screens=$(xrandr | grep -w connected | cut -d' ' -f1)
#for line in screens screens.append(screens=$(xrandr | grep -w connected) + '\n')
#screens=$(echo "${screens%% *}")

#for display in $screens; do
#    #echo "$display"
#    screens=$(echo "${display%% *}")
#done

## select area
chosen=$(echo -e "Hacksaw\nwhole desktop\n$screens" | dmenu -i -p "Select area to screenshot")


case "$chosen" in
    Hacksaw) area=$(hacksaw);;
    "whole desktop") ;;
    $chosen) area=xrandr | grep "$chosen" | cut -d' ' -f3;;
esac

echo $area

## take screenshot
file=$HOME/.cache/rifle/$(date +%Y%m%d-%H%M%S.png)
shotgun -g $area $file

#$chosen$(echo

xclip -t 'image/png' -selection clipboard $file
