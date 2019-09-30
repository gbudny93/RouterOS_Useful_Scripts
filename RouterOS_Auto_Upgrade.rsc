# RouterOS Fucntion 
# Copyright (c) Grzegorz Budny 
# Checks if latest package is available. Downloads it, installs and sends email notification 

:global PackageAutoDownload do={

    /system package update check-for-updates;

    :local packageCurrent [/system package update get installed-version];
    :local packageLatest [/system package update get latest-version];
    :local packageName [/system package get value-name=name number=0];
    :local systemName [/system identity get value-name=name]; 

    :if ($packageCurrent != $packageLatest) do={

        :log info ("...:::New package available - ".$packageLatest." Downloading:::...");
        
        /system package update download;
        
        :log info ("...:::".$packageName." ".$packageLatest." downloaded:::...");
        :delay 2;
    
        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=("Update available on ".$systemName) \ 
        body=($systemName." downloaded latest package ".$packageLatest.". \
        \nInstalling package. System is rebooting.");

        /system reboot; 

    }\
    else={

        :log info ("...:::No updates found. ".$packageCurrent." is the latest version...:::");

    }
}

$PackageAutoDownload userName=userName password=password packagePath=path \
smtpServer=ipAddress smtpPort=poty domain=@example.com \
recipient=recipient@example.com;