#-------Powershell commands-----------------------------------------------------------
#-----Create Resource Group----------------------------------------

New-AzResourceGroup -Name rg-WineStore -Location "Central US"

#-------Powershell commands-----------------------------------------------------------
#-----Create Resources from ARM Temlplate with Parameters File------------------------
New-AzResourceGroupDeployment     
    -ResourceGroupName rg-WineStore
    -TemplateFile .\ch1_arm.json     
    -TemplateParameterFile .\ch1_arm.parameters.json
    -Verbose