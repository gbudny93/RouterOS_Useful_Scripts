# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 4/19/2020
# Simple setup for DUAL WAN failover. Main WAN must be commented as WAN1. Secondary WAN must be commented as WAN2

:global DualWanFailover do={

    
    /ip route add dst-address=8.8.8.8 gateway=[/ip route get value-name=gateway [find distance=1 dst-address=0.0.0.0/0]];
    /ip route add dst-address=8.8.4.4 gateway=[/ip route get value-name=gateway [find distance=2 dst-address=0.0.0.0/0]];

    /tool netwatch add host=8.8.8.8 interval=00:00:10 \
    up-script="/ip route enable [find comment=WAN1 /ip firewall connection remove [find]" down-script="/ip route disable [find comment=WAN1 /ip firewall connection remove [find]";
                                                 
    /tool netwatch add host=8.8.4.4 interval=00:00:10 \
    up-script="/ip route enable [find comment=WAN2 /ip firewall connection remove [find]" down-script="/ip route disable [find comment=WAN2 /ip firewall connection remove [find]";

}

$DualWanFailover

