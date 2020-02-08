# RouterOS Function 
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Generates mail alarm based on log message match 

:global LogToAlert do={

    :local logMessage $message;

    :local logFoundCount; 
    :local logArray;
    :local alarmText; 

    :local logCount [/log print count-only where message~$logMessage];
    :local systemName [/system identity get value-name=name];

    :if ($logCount > 0) do={
        
        :set $logArray [/log find where message~$logMessage];
        :toarray value=$logArray;
        :set logFoundCount [:len value=$logArray];

        :log print file=$fileName where .id=($logArray->($logFoundCount-1));

        :set alarmText [/log print where .id=($logArray->($logFoundCount-1))];

        :log warning "$systemName triggered mail alarm";

        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=($systemName." triggered an alarm!") body="Enclosed detected alarm log message" \ 
        file=$fileName;
        }
}

$LogToAlert message="message" fileName="fileName" smtpServer=smtpServer smtpPort=smtpPort domain="@example.com" \ 
recipient="recipient@example.com";