#-------Powershell commands-----------------------------------------------------------
#-----Create Resource Group----------------------------------------

New-AzResourceGroup -Name rg-VinoWorld -Location "Central US"

#-------Powershell commands-----------------------------------------------------------
#-----Create Resources from ARM Temlplate with Parameters File------------------------
New-AzResourceGroupDeployment     -ResourceGroupName rg-VinoWorld  -TemplateFile .\ch2_arm.json  -TemplateParameterFile .\ch2_arm.parameters.json -Verbose