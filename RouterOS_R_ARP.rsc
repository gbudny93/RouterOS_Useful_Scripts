# RouterOS Function
# Copyright (c) Grzegorz Budny 
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
