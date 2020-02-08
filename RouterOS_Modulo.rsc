# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Modulo function 

:global Modulo do={

    :local truncated;
    :local reminder;

    :set $truncated ($number / $modulo);
    :set $reminder ($number - ($modulo * $truncated));

    :return $reminder
}

$Modulo number=number_to_be_devided modulo=modulo_value;