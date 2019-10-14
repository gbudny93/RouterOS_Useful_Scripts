# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Creates backup and config file and sends them via email

:global MailBackup do={

    :local systemName [/system identity get name];

    :log info "...:::Mail backup started:::...";

    /export file=$configName;
    /system backup save name=$backupName; 

    /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
    to=$recipient subject=($systemName." mail config backup") body="Enclosed backup files" \ 
    file=$configName;

    /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
    to=$recipient subject=($systemName." mail backup") body="Enclosed backup files" \ 
    file=$backupName;

    :log info ("...:::Backup files sent to".$recipient.":::...");
}

$MailBackup configName=configName backupName=backupName smtpServer=smtpServer smtpPort=smtpPort domain=@example.com \
recipient=recipient@example.com;
