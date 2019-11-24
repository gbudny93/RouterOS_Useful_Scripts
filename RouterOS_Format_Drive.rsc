# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Formats RouterOS additional drive 

:global FormatDrive do={

    :local driveLabel [/disk get number=$drive label];

    :log warning ("...:::Drive ".$drive." ".$driveLabel." will be formatted!");
    
    /disk eject-drive $drive;
    /disk format-drive $drive file-system=$fileSystem label=$label;

    :log info ("...:::Drive ".$drive." has been formatted to ".$fileSystem." with label ".$label);

}

$FormatDrive drive=0 fileSystem=ext3 label=data; 
