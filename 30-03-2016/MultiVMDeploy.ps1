#Add Azure Acount

Add-AzureAccount 

#login to Azure RM Account

Login-AzureRmAccount -TenantId ee625913-4a52-403b-8a2e-e97c111417fb

#create/Get new resource group in the subscription

$RGName =New-AzureRmResourceGroup -Name MultiVM -Location "Southeast Asia" -Verbose

$RGName =Get-AzureRmResourceGroup -Name MultiVM -Location "Southeast Asia" -Verbose

#Set the location of the PS prompt 

Set-Location "E:\SCU Demos\MultiVM"

#Set the Veriables for paremeteras 

$cred = Get-Credential 

New-AzureRmResourceGroupDeployment -Name MultiVM -ResourceGroupName $RGName.ResourceGroupName -TemplateParameterFile .\azuredeploy.parameters.json `
-TemplateFile .\azuredeploy.json -adminUsername $cred.UserName -adminPassword $cred.Password -vmCount "4" -Verbose