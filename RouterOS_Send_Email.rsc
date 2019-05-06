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

$SendEmail smtpServer=SMTPServer smtpPort=SMTPPort from=From to=To subject=Subject body=Body


