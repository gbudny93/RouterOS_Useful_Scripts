# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Loads function to RouterOS environment 

:global LoadScript do={

    
    :if ([:len [/file find name=$scriptName]] <= 0) do={
        :log info ($scriptName." not found, make sure file exists!");
    }

    :if ([:len [/file find name=$scriptName]] > 0) do={
        :log info ($scriptName." found. Executing!");
        /system script run $scriptName; 
        :log info ($scriptName." loaded to environment");
    }

}

$LoadScript scriptName=testScript.rsc;



