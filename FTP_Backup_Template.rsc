/system scheduler
add interval=10h name=backup on-event="system backup save name=today.backup" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/1970 start-time=08:00:00
add interval=10h name=config_backup on-event="export file=config.rsc" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/1970 start-time=08:00:00
/system backup save name=today.backup
/export file=config.rsc
/user group
add name=ftp policy="ftp,read,sensitive,!local,!telnet,!ssh,!reboot,!write,!policy,!test,!winbox,!password,!web,!sniff,!api,!romon,!dude"
/user 
add address=0.0.0.0/0 comment="FTP backup" disabled=no group=ftp name="ftp"
/user 
set [find name="ftp"] password="password"