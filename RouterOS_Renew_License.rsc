# RouterOS Script
# Copyright (c) Grzegorz Budny 
# Renews RouterOS License 

:global RenewLicense do={

    :local currentLicenseLevel [/system license get value-name=level];

    :if ($currentLicenseLevel = "free") do={

        /system license renew account=$account password=$password level=$level;
        :log info ("Renewing license for ".$account." to ".$level);

    }
}

$RenewLicense account=account password=password level=level;