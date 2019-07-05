:global LogFilter do={

:local message #message
:local time #time 
:local topics #topic
:local isFile false 
:local fileName #fileName
:local isFilterByMessage true
:local isFilterByTime false
:local isFiltereByTopic false 

        :if($isFile) do={

            :if($isFilterByMessage) do={
        
                :log print file=$fileName where message~$message

             } 
    
        :if($isFilterByTime) do={
        
            :log print file=$fileName where time~$time

        } 

        :if($isFiltereByTopic) do={
        
            :log print file=$fileName where topic~$topic

        } 

        else={ 

            :log print file=$fileName

        }
    
    } 
    else={

        :if($isFilterByMessage) do={
        
            :log print where message~$message

        } 
    
        :if($isFilterByTime) do={
        
            :log print where time~$time

        } 

        :if($isFiltereByTopic) do={
        
            :log print where topic~$topic

        } 

        else={ 

            :log print

        }
    }
}
