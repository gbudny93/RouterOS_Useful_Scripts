# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/12/2020
# Recreates issued bridge in running config 


:global RecreateBridge do={

    /interface bridge remove $bridgeName;
    
    /interface bridge add name=$bridgeName mtu=auto actual-mtu=1500 l2mtu=1592 arp=enabled \
     arp-timeout=auto protocol-mode=none                                                   \
     fast-forward=yes igmp-snooping=no auto-mac=no                                         \
     ageing-time=5m vlan-filtering=yes ether-type=0x8100 pvid=1                            \
     frame-types=admit-all ingress-filtering=yes dhcp-snooping=yes                         \
     add-dhcp-option82=yes;

}
