#Connect Azure account with PowerShell

Add-AzureAccount

#Select the subscription (Login to AzureRM Account)

Login-AzureRmAccount 

#create resorce group for deployment 

New-AzureRmResourceGroup -Name "ARM" -Location "Southeast Asia" -Verbose

#Deploy Azure VM Using ARM template using local file system location

$username = "localadmin"
$password = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
$dnsprifix = "kasunvm1"

New-AzureRmResourceGroupDeployment -Name "TestDeploy" -ResourceGroupName "ARM" `
-TemplateParameterFile '.\101-vm-simple-windows\azuredeploy.parameters.json' `
-TemplateFile '.\101-vm-simple-windows\azuredeploy.json' `
-adminUsername $username -adminPassword $password  -dnsLabelPrefix $dnsprifix -Verbose