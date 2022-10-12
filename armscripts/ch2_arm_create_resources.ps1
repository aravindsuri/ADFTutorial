#-------Powershell commands-----------------------------------------------------------
#-----Create Resource Group----------------------------------------

New-AzResourceGroup -Name rg-vinoworld-dev -Location "Germany West Central"

#-------Powershell commands-----------------------------------------------------------
#-----Create Resources from ARM Temlplate with Parameters File------------------------
New-AzResourceGroupDeployment     -ResourceGroupName rg-vinoworld-dev  -TemplateFile .\ch2_arm.json  -TemplateParameterFile .\ch2_arm.parameters.json -Verbose