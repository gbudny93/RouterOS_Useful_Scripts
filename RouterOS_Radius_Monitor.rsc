# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Sends Radius statistics via email

:global RadiusMonitor do={

    :local systemName [/system identity get value-name=name];

    :local service [/radius get value-name=service number=0];
    :local address [/radius get value-name=address number=0];
    :local protocol [/radius get value-name=protocol number=0];
    :local authPort [/radius get value-name=authentication-port number=0];
    :local acccPort [/radius get value-name=accounting-port number=0];
    :local timeout [/radius get value-name=timeout number=0];
    :local srcAddress [/radius get value-name=src-address number=0];

    :local radiusStatus [/radius monitor numbers=0 once as-value];

    :set $radiusStatus [:tostr $radiusStatus;]

    :log info "...:::Generating status report and sending:::...";

    /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=($systemName." Radius Stats") \ 
        body=($systemName." Radius Stats. \n\n"             \
                     ."Service: ".$service."\n"             \
                     ."Address: ".$address."\n"             \
                     ."Protocol ".$protocol."\n"            \
                     ."Auth Port: ".$authPort."\n"          \
                     ."Acc Port: ".$acccPort."\n"           \
                     ."Timeout: ".$timeout."\n"             \
                     ."Src Address: ".$srcAddress."\n\n"    \
                     ."Overall Stats: \n\n\n"               \
                     .$radiusStatus);

    :log warning "...:::Resetting Radius Counters:::...";

    /radius reset-counters 

}

$RadiusMonitor smtpServer=smtpServer smtpPort=smtpPort domain="@example.com" recipient="recipient@example.com";