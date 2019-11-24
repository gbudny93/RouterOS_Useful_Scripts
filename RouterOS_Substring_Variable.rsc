# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Substring variable 

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
