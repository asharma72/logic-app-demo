armclient token tokenid | Get-LogicAppTemplate -LogicApp logic-app-demo1 -ResourceGroup logic-app-demo-rg -SubscriptionId SubscriptionId -Verbose | Out-File C:\template.json

Install-Module -Name LogicAppTemplate     

choco install armclient -f            
 armclient login     
