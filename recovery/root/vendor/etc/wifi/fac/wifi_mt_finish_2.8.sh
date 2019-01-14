
#!/bin/sh

LOG_TAG="Wifi_mt"
LOG_NAME="${0}:"

logi ()
{
    /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

iwpriv wlan0 tx_cw_rf_gen 0
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 tx_cw_rf_gen 0 success"
else
    logi "iwpriv wlan0 tx_cw_rf_gen 0 fail."
fi
iwpriv wlan0 ftm 0
if [ "$?" == "0" ]; then
    logi "iwpriv wlan0 ftm 0 success"
else
    logi "iwpriv wlan0 ftm 0 fail."
fi
#Wifi builtin condition check
wifi_builtin=`getprop wifi.driver.builtin`
if [ "$wifi_builtin" = "enable" ]; then
    echo stop > /proc/wifi_built_in/wifi_start
else
    rmmod wlan
fi
if [ "$?" == "0" ]; then
    logi "rmmod wlan success"
else
    logi "rmmod wlan fail."
fi
setprop wifi.mt.status stopped

