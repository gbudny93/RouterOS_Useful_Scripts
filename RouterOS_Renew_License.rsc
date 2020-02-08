# RouterOS Script
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Renews RouterOS License 

:global RenewLicense do={

    :local currentLicenseLevel [/system license get value-name=level];

    :if ($currentLicenseLevel = "free") do={

        /system license renew account=$account password=$password level=$level;
        :log info ("Renewing license for ".$account." to ".$level);

    }
}

$RenewLicense account=account password=password level=level;