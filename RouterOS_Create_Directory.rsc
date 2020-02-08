# RouterOS Function 
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Creates directory in RouterOS

:global CreateDirecotry do={

    :global userName;
    :global password;
    :global directoryName;
    :global tempFileName temp.rsc;

    /system identity export file=$tempFileName;
    /tool fetch address=127.0.0.1 src-path=$tempFileName user=$userName password=$password \
    dst-path=($directoryName."/".$tempFileName) mode=ftp port=21;

    /file remove ($directoryName."/".$tempFileName);
    /file remove $tempFileName;

    :log info ("New directory created - ".$directoryName);

}

$CreateDirecotry userName=UserName password=Password directoryName=DirectoryName;


