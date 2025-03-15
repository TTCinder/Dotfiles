#############____Binary__________
##		save as a executable on any bin directory eg . ~/bin/powermenu
 
#!/bin/env bash
 
# Options for powermenu
lock=""
logout=""
shutdown=""
reboot="↺"
sleep=""
 
# Obtener respuesta del usuario a través de rofi
selected_option=$(echo "$lock
$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -theme "/home/joaquin/.config/rofi/themes/powermenuStyle.rasi")
# Realizar una acción basada en la opción seleccionada
if [ "$selected_option" == "$lock" ]; then
    swaylock -C /home/joaquin/.config/swaylock/config
elif [ "$selected_option" == "$logout" ]; then
    loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]; then
    shutdown now
elif [ "$selected_option" == "$reboot" ]; then
    reboot
else
    echo "No hay coincidencia"
fi

 
 
 
 

 
 