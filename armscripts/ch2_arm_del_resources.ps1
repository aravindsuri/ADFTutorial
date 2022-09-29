#-----------------------------------------------------------------
#------------Delete Resource Group--------------------------------

Get-AzResourceGroup -Name "rg-VinoWorld" | Remove-AzResourceGroup -Verbose -Force
