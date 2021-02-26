mkdir /tmp/lock
scrot /tmp/lock/screen.png
convert /tmp/lock/screen.png -scale 10% -scale 1000% /tmp/lock/screen.png
[[ -f $1 ]] && convert /tmp/lock/screen.png $1 -gravity center  -composite -matte /tmp/lock/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
xscreensaver-command -lock
#i3lock -i /tmp/screen.png
#rm /tmp/screen.png
