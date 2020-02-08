# RouterOS Fucntion 
# Copyright (c) Grzegorz Budny
# Version 1.0 
# Last update: 2/8/2020
# Checks if latest firmware is available. Installs it and sends email notification 

:global AutoFirmwareUpgrade do={

    :local currentFirmware [system routerboard get current-firmware];
    :local upgradeFirmware [system routerboard get upgrade-firmware];
    :local systemName      [/system identity get value-name=name];

    :if ($currentFirmware != $upgradeFirmware) do={

        :log info ("...:::New firmware version found. Upgrading from ".$currentFirmware." to ".$upgradeFirmware.":::...");
        /system routerboard upgrade; 
        
        :delay 2;

        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=("Update available on ".$systemName) \ 
        body=($systemName." is upgrading to ".$upgradeFirmware.". \
        \nfirmware version. System is rebooting.");

        :delay 2;

        /system reboot; 

    }
}

$AutoFirmwareUpgrade smtpServer=smtpServer smtpPort=smtpPort domain=example.com \
recipient=recipient@example.com;
