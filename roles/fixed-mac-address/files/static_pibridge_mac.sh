#!/bin/bash

if [[ $(id -u) != 0 ]]; then
    echo "usage: sudo $(basename $0)"
    exit 1
fi

pibridge_static_mac() {
    interface=$1

    if [[ $interface != "pileft" && $interface != "piright" ]]; then
            echo 2>&1 "interface is not a PiBridge interface: ${interface}"
            exit 3
    elif [[ ! -e /sys/class/net/${interface} ]]; then
            echo 2>&1 "warning: network interface does not exists: ${interface}"
    fi

    mac=$(ip l show $interface | grep ether | xargs | cut -f 2 -d ' ' | sed -e 's/://g')

    mac_hi=${mac:0:8}
    mac_lo=${mac:8:12}

    grep -q dtparam=${interface}_mac_hi /boot/config.txt || echo "dtparam=${interface}_mac_hi=0x$mac_hi" >> /boot/config.txt
    grep -q dtparam=${interface}_mac_lo /boot/config.txt || echo "dtparam=${interface}_mac_lo=0x$mac_lo" >> /boot/config.txt
}

pibridge_static_mac pileft
pibridge_static_mac piright

