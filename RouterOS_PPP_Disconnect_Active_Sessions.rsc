# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 3/15/2020 
# Disconnects all active PPP sessions at once 

:global DisconnectActivePPPSesssions do={

    :local pppSessions [/ppp active print count-only];

    :for i from=0 to=$pppSessions step=1 do= \
    {

        /ppp active remove numbers=$i;
        :log info ("...:::Removing PPP Sesion no ".$i.":::..."; 
    
    }

    :log info ("...:::Removed PPP sessions: ".$pppSessions);

}

$DisconnectActivePPPSesssions; 