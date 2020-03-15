# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/14/2020
# Makes device backup and configuration backup, sends files to FTP server 

:global FTPBackup do={

    :local systemName [/system identity get value-name=name];

    :log info "...:::FTP backup job started:::...";

    /export file=$configName;
    /system backup save name=$backupName; 

    /tool fetch src-path=$configName mode=ftp dst-path=$destPath       \
    user=$ftpUser password=$ftpPassword port=21 upload=yes   \
    address=$ftpServer;

    /tool fetch src-path=$backupName mode=ftp dst-path=$destPath       \
    user=$ftpUser password=$ftpPassword port=21 upload=yes   \
    address=$ftpServer;

    /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
    to=$recipient subject=($systemName." FTP backup job completed") body=("FTP backup job completed to ".$ftpServer) \ 

    :log info ("...:::Backup files sent to".$recipient.":::...");
}

$FTPBackup configName=configName backupName=backupName smtpServer=smtpServer smtpPort=smtpPort domain=@example.com \
recipient=recipient@example.com destPath=destPath ftpUser=user ftpPassword=password ftpServer=ftpserver;