# logic-app-demo

armclient token b7bf78ca-53f8-4619-8225-8233c03cdc8a | Get-LogicAppTemplate -LogicApp logic-app-demo1 -ResourceGroup logic-app-demo-rg -SubscriptionId b7bf78ca-53f8-4619-8225-8233c03cdc8a -Verbose | Out-File C:\template.json

Install-Module -Name LogicAppTemplate     

choco install armclient -f            
 armclient login     
