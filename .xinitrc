#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

## test for an existing bus daemon, just to be safe
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
    ## if not found, launch a new one
    eval `dbus-launch --sh-syntax --exit-with-session`
    echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

# Load terminal settings
xrdb ~/.Xresources

# Autostart Programs
xcompmgr &
nm-applet &
#dropboxd &
urxvtd &


default_session=awesome

case $1 in

awesome)

    # Start WM
    exec ck-launch-session awesome
    ;;
scrotwm)
    # Start WM
    exec ck-launch-session scrotwm
    ;;
xmonad)
    trayer --edge top --align right --SetDockType true --SetPartialStrut true
    q
    --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
    ;;
*)
    exec $default_session
    ;;
esac
