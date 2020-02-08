# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Changes LCD mode based on time schedule 

:global ChangeLcd do={

    :local systemTime [/system clock get value-name=time];
    :local lcdMode [/lcd get color-scheme];

    :local lightModeStart $lightModeStartTime;
    :local darkModeStart $darkModeStartTime;

    :if ($systemTime = $lightModeStart && $lcdMode = "dark") do={

        /lcd set color-scheme=light;
        /log info "..::Changed LCD mode to LIGHT::.."
    
    }
    :if ($systemTime = $darkModeStart && $lcdMode = "light") do={

        /lcd set color-scheme=light;
        /log info "..::Changed LCD mode to DARK::.."

    }
}

$ChangeLcd lightModeStartTime="08:00:00" darkModeStartTime="17:00:00";