# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Reset interface if particular IP does not respond 

:global ResetInterface do={

    :if ([/ping $ipAddress interval=1 count=4] > 0) do={
        
            :log info "...:::Interface healthcheck. Status OK:::..."
        
        }\
        else={
            
            :log error ("...:::Monitor detected ".$interfaceName." down. Resetting:::...");
            /interface ethernet disable $interfaceName;
            :delay 3;
            /interface ethernet enable $interfaceName;

        }
}      

$ResetInterface ipAddress=ipAddress_To_Monitor interfaceName=interface_name;