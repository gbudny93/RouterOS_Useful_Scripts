# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 3/23/2020
# DUDE Server initial setup on RB750GR3 with microSD or USB drive

:global SetupDudeRB750GR3 do={

    :local isDude [/system packages find name=dude];
    
    :if ($isDude) do={

        :log info "...:::Started DUDE Server Setup:::...";
        :log warning "...:::Formatting drive:::...";

        /disk eject-drive $driveNumber;

        :do {

            /disk format-drive $driveNumber file-system=ext3 label=$driveLabel;

        } on-error={

            :log critical "...:::Formatting failed. Check your drive:::...";

        }
    
        :log info "...:::Formatting finished:::...";

        /dude set data-directory=$dudeDirectory;
        /dude set enabled=yes;

        }\
        else={

            :log critical "...:::Setup failed. Install DUDE package first:::...";

        }
}


$SetupDudeRB750GR3 driveNumber=driveNumber driveLabel=driveLabel dudeDirectory=directoryName;