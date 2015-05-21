#Citrix XenApp Check

The script check version, product and logon/logoff on Citrix Xenapp

##Installation

##### Add to configuration in Zabbix Agent

```
UserParameter=ctx[*],%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command "& C:\Zabbix\xenapp-check.ps1 $1"
```

##### Argument

Use **ctx** like an External Check item in Zabbix. So, when creating an item, select External Check. In the Key field, you specify:

```
ctx["ARGUMENT"]
```


##Requirements

This script was tested for Zabbix 2.0.0 or higher.

##Version 

Version 1.0
