# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.1 
# Last update: 2/14/2020
# Creates new backup file and uploads it to MikroTik Cloud

:global CloudBackup do={

    :local systemLicense [/system license get value-name=level];
    :local systemName [/system identity get value-name=name];

    :if ($currentLicenseLevel != "free") do={

        :log info "...:::License allows cloud backup, process started:::..."
        
        /system backup cloud upload-file action=create-and-upload file=cloudBackup.backup password=password

        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=($systemName." cloud backup created.") body=($systemName." created MikroTik cloud backup.");

        :log info "...:::Cloud Backup Created:::...";

    }
}

$CloudBackup smtpServer=smtpServer smtpPort=smtpPort domain=@example.com recipient=recipient@example.com;