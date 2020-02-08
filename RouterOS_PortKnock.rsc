# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Port Knock from RouterOS

:global PortKnock do={


    :foreach sourceAddress, destinationPort in $base do={

        :log info "...:::Port Knocking Sequance Started:::...";
        :log warning ("Knocking to ".$destinationAddress." on port ".$destinationPort." from ".$sourceAddress);

        /system ssh src-address=$sourceAddress port=$destinationPort address=$destinationAddress;


    }

    :log info ("...:::Port Knocking Finished check access to ".$destinationAddress);

}

:global knockBase {"sourceIP1"="port23"; \
                   "sourceIP2"="port22"  \
                  };

$PortKnock base=$knockBase destinationAddress=destinationIP;