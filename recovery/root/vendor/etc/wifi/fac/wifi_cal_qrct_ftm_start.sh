
#!/bin/sh

LOG_TAG="Wifi_qrct_cal"
LOG_NAME="${0}:"

logi ()
{
    /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

if [ ! -d /data/misc ]; then
    logi "the directory does not exist"
fi

svc wifi disable

if [ "$?" == "0" ]; then
    logi "wifi disable success"
else
    logi "wifi disable failed."
fi

setprop wifi.mt.status running

stop ptt_socket_app
if [ "$?" == "0" ]; then
    logi "stop ptt_socket_app success"
else
    logi "stop ptt_socket_app failed."
fi

stop wpa_supplicant
if [ "$?" == "0" ]; then
    logi "stop wpa_supplicant success"
else
    logi "stop wpa_supplicant failed."
fi
stop p2p_supplicant
if [ "$?" == "0" ]; then
    logi "stop p2p_supplicant success"
else
    logi "stop p2p_supplicant failed."
fi
ifconfig p2p0 down
ifconfig wlan0 down

start ptt_socket_app
if [ "$?" == "0" ]; then
    logi "start ptt_socket_app success."
else
    logi "start ptt_socket_app failed"
fi

