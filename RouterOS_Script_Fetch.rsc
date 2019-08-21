# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Fetches RouterOS script from external https location and runs it or creates schedule task

:global FetchScript do={

    tool fetch mode=https http-method=get url=$url dst-path=($destinationPath."/".$destinationFileName);

    :if($isRun)do={

        /system script run ($destinationPath.$destinationFileName);

    }
    :if($isSchedule)do={

        /system scheduler \
        add interval=($interval.h) name=$taskName on-event=("system script run ".($destinationPath."/".$destinationFileName)) \
        policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
        start-date=jan/01/1970 start-time=$startTime;

    }
}

#$FetchScript url="https://example.repo.com" destinationPath="FolderName" destinationFileName="ScriptName" 

#$FetchScript url="https://example.repo.com" destinationPath="FolderName" destinationFileName="ScriptName" isRun=true

#$FetchScript url="https://example.repo.com" destinationPath="FolderName" destinationFileName="ScriptName" isSchedule=true\
#interval="24" taskName="TaskName" startTime="startup"


