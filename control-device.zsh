#!/bin/zsh

LenovoHub=17ef
UsbPower=3
# Turn USB Power On then Off to reset device state to OFF
uhubctl --vendor $LenovoHub --action on --ports $UsbPower
sleep 1
uhubctl --vendor $LenovoHub --action off --ports $UsbPower
sleep 1

# Turn Device On
# by holding power button pressed for 1 second

# USB Relay module similar to
# https://www.smart-prototyping.com/USB-Relay-1-Channel
#
# Commands:
# Turn On: A0 01 01 A2
# Turn Off: A0 01 00 A1

usbRelayPath=/dev/cu.usbserial-3140
usbRelayOn='\xA0\x01\x01\xA2'
usbRelayOff='\xA0\x01\x00\xA1'
echo -en $usbRelayOn > $usbRelayPath
sleep 2
echo -en $usbRelayOff > $usbRelayPath
