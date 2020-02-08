# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# After defined number of logon failure attempts in 1 hour sends email alert and blocks source IP on firewall

:global UserAlert do={

    :local logMessage $message;

    :local logFoundCount; 
    :local logArray;
    :local alarmText; 

    :local hour [:pick [/system clock get time] 0 2];
    :local logCount [/log print count-only where message~$logMessage];
    :local systemName [/system identity get value-name=name];

    :if ($logCount > $treshhold) do={
        
        :set $logArray [/log find where message~$logMessage time~$hour];
        :toarray value=$logArray;
        :set logFoundCount [:len value=$logArray];

        :log print file=$fileName where .id=($logArray->($logFoundCount-1));

        :set alarmText [/log print where .id=($logArray->($logFoundCount-1))];

        :log warning "$systemName triggered an alarm";

        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=($systemName." triggered an alarm!") body="Enclosed detected alarm log message" \ 
        file=$fileName;
        }
}

$UserAlert message="message" treshhold=3 fileName="fileName" smtpServer=smtpServer smtpPort=smtpPort domain="@example.com" \ 
recipient="recipient@example.com";