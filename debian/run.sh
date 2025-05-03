#!/bin/bash

start()
{
	/usr/bin/vncserver -depth 24 -geometry 1440x900 :1
	/usr/share/t3-gem-vnc/utils/novnc_proxy --vnc localhost:5901 --listen 8443 --cert "$HOME/.config/t3-gem-vnc/self.pem"
	novnc_pid=$!
}

stop()
{
	[ -n "$novnc_pid" ] && kill -9 "$novnc_pid"

	/usr/bin/vncserver -kill :1 > /dev/null 2>&1 || return 0
}

$1
