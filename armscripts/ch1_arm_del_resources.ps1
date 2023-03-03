#-----------------------------------------------------------------
#------------Delete Resource Group--------------------------------

Get-AzResourceGroup -Name "rg-WineStore" | Remove-AzResourceGroup -Verbose -Force
