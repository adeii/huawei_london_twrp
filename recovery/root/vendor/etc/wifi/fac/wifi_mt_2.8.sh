
#!/bin/sh

LOG_TAG="Wifi_mt"
LOG_NAME="${0}:"
n_check=5

logi ()
{
    /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

if [ ! -d /data/misc ]; then
    logi "the directory does not exist"
fi

#/system/bin/wlan_detect
setprop wifi.mt.status running
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

wifi_builtin=`getprop wifi.driver.builtin`

while(($n_check>0))
do
    #Wifi builtin condition check
    if [ "$wifi_builtin" = "enable" ]; then
        echo stop > /proc/wifi_built_in/wifi_start
    else
        rmmod wlan
    fi
    if [ "$?" == "0" ]; then
        logi "rmmod wlan success"
    else
        logi "rmmod wlan failed."
    fi
    #Wifi builtin condition check
    if [ "$wifi_builtin" = "enable" ]; then
        echo ftm > /proc/wifi_built_in/wifi_start
    else
        insmod /system/lib/modules/wlan.ko con_mode=5
    fi
    if [ "$?" == "0" ]; then
        logi "insmod wlan success"
        n_check=0
    else
        logi "insmod wlan failed."
        n_check=$(($n_check-1))
    fi
done
#ptt_socket_app
iwpriv wlan0 ftm 1
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 ftm 1 success"
else
    logi "iwpriv wlan0 ftm 1 failed."
fi
iwpriv wlan0 ena_chain 2
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 ena_chain 2 success"
else
    logi "iwpriv wlan0 ena_chain 2 failed."
fi
iwpriv wlan0 set_channel 6
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 set_channel 6 success"
else
    logi "iwpriv wlan0 set_channel 6 failed."
fi
iwpriv wlan0 set_tx_wf_gain 0 6
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 set_tx_wf_gain 0 6 success"
else
    logi "iwpriv wlan0 set_tx_wf_gain 0 6 failed."
fi
iwpriv wlan0 tx_cw_rf_gen 1
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 tx_cw_rf_gen 1 success"
else
    logi "iwpriv wlan0 tx_cw_rf_gen 1 failed."
fi

