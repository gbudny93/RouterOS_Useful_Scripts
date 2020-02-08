# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Substrings variable 

:global Subtring do={

    :global substring;

    :if ($findMode=true) do={

        :set $substring [:pick $string [:find $string $signA] [:find $string $signB]];
        :return $substring; 

    }\
    else={

        :set $substring [:pick $string $signA $signB];
        :return $substring;

    }
}

$Substring findMode=true string="string" signA="A" signB "b";
