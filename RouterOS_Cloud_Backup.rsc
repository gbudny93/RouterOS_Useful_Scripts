# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Create new backup file and uploads it to cloud

:global CloudBackup do={

    :local systemLicense [/system license get value-name=level];
    :local systemName [/system identity get name];

    :if ($currentLicenseLevel != "free") do={

        :log info "...:::License allows cloud backup, process started:::..."
        
        /system backup cloud upload-file action=create-and-upload file=cloudBackup.backup password=password

        /tool e-mail send server=$smtpServer port=$smtpPort from=($systemName.$domain) \ 
        to=$recipient subject=($systemName." cloud backup created.") body=($systemName." created MikroTik cloud backup.");

        :log info "...:::Cloud Backup Created:::...";

    }
}