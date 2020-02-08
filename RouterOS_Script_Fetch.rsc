# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Fetches RouterOS script from external https location and runs it or creates schedule task

:global FetchScript do={

        :foreach url,destinationFileName in=$urls do={

            /tool fetch mode=https http-method=get url=$url dst-path=($destinationPath."/".$destinationFileName);
            :log info "...:::Scripts fetched:::...";

            :if ($isRun) do={

                /system script run ($destinationPath.$destinationFileName);
                :log info "...:::Script loaded to environment:::...";

            }
            :if ($isSchedule) do={

                /system scheduler \
                add interval=($interval.h) name=$taskName on-event=("system script run ".($destinationPath."/".$destinationFileName)) \
                policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
                start-date=jan/01/1970 start-time=$startTime;
                :log info "...:::Script joined to scheduler:::...";

        }
    }
}

#Example
:global urlsBase {"URL1"="script1"; \
                  "URL2"="script2"  \
                 };

$FetchScript urls=$urlsBase destinationPath="destinationPath" destinationFileName=$urlsBase;