# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# ARP/RARP Function (shortange syntax) 

:global R_ARP do={

    :if ($mode="ARP") do={

        :return [/ip arp print where mac-address=$ip];

    }

    :if ($mode="RARP") do={

        :return [/ip arp print where mac-address=$mac];

    }
}

$R_ARP mode=mode; 
