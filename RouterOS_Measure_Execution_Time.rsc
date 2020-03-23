# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 3/22/2020
# Measures script execution time

:global MeasureExecutionTime do={

    :local timeDifferance; 
    :local startTime [/system clock get time];
    
    /system script run $scriptName; 

    :local endTime [/system clock get time]
    :set $timeDifferance ($endTime-$startTime);

    :if($return) do={

        :return $timeDifferance; 

    }\
    else={

        :put ("Script executed in : ".$timeDifferance);

    }

    :set $timeDifferance;

}

$MeasureExecutionTime scriptName=scriptName return=true;