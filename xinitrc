#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xcompmgr &

xrdb /home/rndmprsn/.Xresources &
setxkbmap -option caps:super &

#exec bspwm
#exec startkde
exec i3
