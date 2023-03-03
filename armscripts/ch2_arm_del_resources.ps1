#-----------------------------------------------------------------
#------------Delete Resource Group--------------------------------

Get-AzResourceGroup -Name "rg-vinoworld-dev" | Remove-AzResourceGroup -Verbose -Force
