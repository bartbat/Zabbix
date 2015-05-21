# Script: WMI Citrix-XenApp
# Author: Bélaïd YOUNSI (belaid[dot]younsi |at| gmail |dot| com)
# Description: Query Citrix Xenapp
# License: GPL2
#
# This script is intended for use with Zabbix > 2.0
# 
# USAGE:
#   as a script:    C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe -command  "& C:\Zabbix\zabbix_citrix_xenapp.ps1 <ITEM_TO_QUERY>"
#   as an item:     ctx[<ITEM_TO_QUERY>]
#   as a query : Logon, Version, Product
#
# Add to Zabbix Agent
#   UserParameter=ctx[*],%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command "& C:\Zabbix\zabbix_citrix_xenapp.ps1 $1"
#


$comp = '.'
$ITEM = $args[0]

Switch ($ITEM) {

	"Version" {
	$query1 = gwmi -Class Citrix_Product -Namespace root/citrix -computername $comp | select Version 
	foreach($objItem in $query1){
	Write-Host $objItem.Version
	}
	
}

	"Product"{
	$query2 = gwmi -Class Citrix_Product -Namespace root/citrix -computername $comp
	foreach($objItem in $query2){
	Write-Host $objItem.ProductName
	}
		

}


	"Logon"{
	$query3 = gwmi -Class MetaFrame_Server -Namespace root/citrix -computername $comp
	foreach($objItem in $query3){
	switch ($objItem.LoginsEnabled){
	"True" { return 1; }
	"false" { return 0; }
	
}
	
	}	

		
}

default {
      Write-Host "-- ERROR -- : Need an option to work !"
  }
}
