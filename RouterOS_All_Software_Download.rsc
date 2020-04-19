# RouterOS Fucntion 
# Copyright (c) Grzegorz Budny
# Version 1.0 
# Last update: 4/19/20
# Automated download of all latest RouterOS standard packages. 
# Tool recommended to CAPsMAN and DUDE servers

:global AutoSoftwareDownload do={

    /system package update check-for-updates;

    :local packageLatest [/system package update get latest-version];

    :local packages {"mipsbe"; "smips"; "tile"; "powerpc"; "arm"; "x86"; "mmips"};

    :foreach package in=$packages do={

        /tool fetch http-method=get mode=https url=("https://download.mikrotik.com/routeros/".$packageLatest."/routeros-".("$package")."-".$packageLatest.".npk") dst-path=($destinationPath."/routeros-".("$package")."-".$packageLatest.".npk");
        :log ("...:::Downloading "."/routeros-".("$package")."-".$packageLatest.".npk");
        
    }
}

#Example: 
#$AutoSoftwareDownload destinationPath=destination_path