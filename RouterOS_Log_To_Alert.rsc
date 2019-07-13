:global LogToAlert do={


    :local logMessage $message
    :local logCount [/log print count-only where message~$logMessage]
    :local logArray

    :put $logCount


    :if ($logCount > 0) do={

        :set $logArray [/log find where message~$logMessage]
        :toarray value=$logArray

        :log print where .id=($logArray->0)

    }

}
$LogToAlert message="winbox"