# RouterOS_Useful_Scripts
> MikroTik RouterOS Scripts for various use and shared among different projects. Repository contains ready to use scripts as well functions ready to use in larger projects. 

![](https://img.shields.io/badge/version-1.0-blue.svg)
![](https://img.shields.io/badge/scripting-routeros-important.svg)

## Change log 

  - 6/14/2019 v1.0 first release
    - FTP_Backup_Template.rsc
      - Schedules generation of *.backup* and *.rsc* file on RouterOS. Create FTP user dedicated for automatic backups. More on automatic RouterOS
      backups can be found under dedicated project: :link: [Backup_mt by gbudny93](https://github.com/gbudny93/Backup_mt)
    - RouterOS_Auto_Upgrade.rsc
      - in progress
    - RouterOS_Create_Directory.rsc
      - Function that creates directory with specific name in RouterOS
    - RouterOS_Log_Filtering.rsc
      - in progress
    - RouterOS_Log_To_Alert.rsc
      - in progress
    - RouterOS_Send_Email.rsc
      - Fucntion sending email via SMTP server with common email parameters as function parameters
    
## Prerequisites

  -  :white_check_mark: RouterOS v6.40 or higher
  


## Usage

> Use the following scripts to make your RouterOS management easier or use them in various scripts you write 
:+1: 

### FTP_Backup_Template.rsc

> This script creates two files via RouterOS scheduler as well creates FTP user and group: 
  - *.backup* file 
  - *.rsc* file 
  
Script is a part of  :link: [Backup_mt by gbudny93](https://github.com/gbudny93/Backup_mt) project.

### RouterOS_Auto_Upgrade.rsc

 :soon:

### RouterOS_Create_Directory.rsc

> RouterOS function that creates directory with defined name in the system. Can be used just to create directory or be a part of larger project. 

**Example**
 ```rascal
 $CreateDirecotry userName=UserName password=Password directoryName=DirectoryName
```

### RouterOS_Log_Filtering.rsc

 :soon:

### RouterOS_Log_To_Alert.rsc

 :soon:

### RouterOS_Send_Email.rsc

> RouterOS function to send email via SMTP server. Function contains all common email fields like *to*, *cc*, *subject*, *body* and more. Function can be called itself in RouterOS or by other script.

**Example**
```
$SendEmail smtpServer=SMTPServer smtpPort=SMTPPort from=From to=To subject=Subject body=Body
```

## Authors

  - Grzegorz Budny




  
  

