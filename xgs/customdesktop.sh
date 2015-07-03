# for your desktop session
# /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
# session-setup-script=/usr/share/mycustomdesktopvideo.sh

#xrandr --output HDMI1 --mode 1920x1200 --right-of LVDS1

xrandr --output HDMI1 --mode 1920x1080 --right-of DP1
xrandr --output DP1 --mode 1920x1080 --rotate left --left-of HDMI1

