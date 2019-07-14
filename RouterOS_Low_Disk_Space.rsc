# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Generates log alert when free disk space reach specified treshhold 

:global LowDiskSpace do={

    :local alertSpace $treshhold;
    
    :local freeSpace [/system resource get free-hdd-space];
    :local totalSpace [/system resource get total-hdd-space];

    :local diskUsage (($freeSpace * 100)/$totalSpace);

    :if ($diskUsage < $treshhold) do={

        /log warning ("Disk space reached ".$treshhold." % treshold. Free disk space is ".$diskUsage."%");

    }
}

$LowDiskSpace treshhold=free_disk_space_in_%;