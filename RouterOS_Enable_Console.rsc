# RouterOS Function 
# Copyright (c) Grzegorz Budny 
# Enables Console port 

:global EnableConsole do={

    /system console disable 0
    /port set serial0 baud-rate=19200 data-bits=8 parity=none stop-bits=1

    :log info "...:::Console Enabled. System needs to be rebooted:::..."

    #/port set serial0 baud-rate=auto

}