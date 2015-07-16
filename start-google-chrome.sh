#!/bin/bash
groupmod -g $gid google-chrome
usermod -u $uid -g $gid google-chrome

if [ ! -f "/home/google-chrome/.config/google-chrome/First Run" ]; then
  touch "/home/google-chrome/.config/google-chrome/First Run"
fi

if [ -d /home/google-chrome/.config ]; then
  chown -R google-chrome:google-chrome /home/google-chrome/.config
fi

su -ls "/bin/bash" -c "/usr/bin/google-chrome-stable '$ARGS' '$URL'" google-chrome
