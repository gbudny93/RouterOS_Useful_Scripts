:global SendEmail do={

:local smtpServer #smtp server IP
:local smtpPort #smtp port 
:local from #sender email 
:local to #recipeints email
:local cc #cc email
:local subject #email subject 
:local body #email body

:log info "..::Sending email notification::..";
tool e-mail send server=$smtpServer port=$smtpPort from=$from to=$to cc=$cc subject=$subject body=$body;

}

#Here script starts 

:local message #message
:local systemName [/system identity get value-name=name]
:local recipient #recipient
:local logCount [/log print count-only where message~$message]
:local logArray [/log find where message~$message]

:toarray value=$logArray

:if (logCount > 0) do={

    :log warning "..::Alert detected:..";
    $SendEmail smtpServer=#SMTPIP smtpPort=Port from=($systemName."domain") to=$recipient subject=($systemName." Triggered and Alert!") body=($logArray->1)
    :log info ("..::Alert has been sent to ".$recipient)

}






