#!/bin/bash
rofi -i -show drun -modi drun -show-icons &
sleep 0.07
xdotool search --onlyvisible --class "rofi" windowmove 9 29
