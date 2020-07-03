# RouterOS Fucntion 
# Copyright (c) Grzegorz Budny
# Version 1.1 
# Last update: 2020-07-03 10:07:02
# Automated download of all latest RouterOS standard packages. 
# Tool recommended to CAPsMAN and DUDE servers

:global AutoSoftwareDownload do={

    /system package update check-for-updates;

    :local packageLatest [/system package update get latest-version];

    :local packages {"mipsbe"; "smips"; "tile"; "powerpc"; "arm"; "x86"; "mmips"};

    :foreach package in=$packages do={

        /tool fetch http-method=get mode=https url=("https://download.mikrotik.com/routeros/".$packageLatest."/routeros-".("$package")."-".$packageLatest.".npk") dst-path=($destinationPath."/routeros-".("$package")."-".$packageLatest.".npk");
        :log info ("...:::Downloading "."/routeros-".("$package")."-".$packageLatest.".npk");
        
    }
}

#Example: 
#$AutoSoftwareDownload destinationPath=destination_path