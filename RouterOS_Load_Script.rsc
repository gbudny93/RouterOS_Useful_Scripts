# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Loads function to RouterOS environment 

:global LoadScript do={

    
    :if ([:len [/file find name=$scriptName]] <= 0) do={
        
        :log info ($scriptName." not found, make sure file exists!");
    
    }

    :if ([:len [/file find name=$scriptName]] > 0) do={
        
        :log info ($scriptName." found. Executing!");
        /system script run $scriptName; 
        
    }

}

$LoadScript scriptName=scriptName.rsc;



