#!/bin/bash

# Raise DPI from 96 to 276 to makes text size front
xfconf-query -c xsettings -p /Xft/DPI -s 96

# Enlarge cursor size
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 16

# Raise xfce panel height
xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 32

# Enlarge notification area icon
xfconf-query -c xfce4-panel -p /plugins/plugin-6/size-max -s 26

# Enlarge window size
xfconf-query -c xfce4-desktop -p /last/window-height -s 614
xfconf-query -c xfce4-desktop -p /last/window-width -s 505

# Enlarge desktop icon
xfconf-query -n -t uint -c xfce4-desktop -p /desktop-icons/icon-size -s 32

# Use xhdpi theme, you can alsto use "Default-hdpi"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark-GalliumOS"

# Enlarge most of the icons
xfconf-query -c xsettings -p /Gtk/IconSizes -s ""

# Set extended monitor
EX_MONITOR=$(xrandr | grep " connected" | cut -d " " -f1 | sed -n 2p)
xrandr --output eDP-1 --mode 1600x900 --left-of $EX_MONITOR \
  --output $EX_MONITOR --primary

# Set xfce4-panel power manager plugin icon size
cp $(dirname $0)/assets/gtk.dual.css ~/.config/gtk-3.0/gtk.css
xfce4-panel -r
