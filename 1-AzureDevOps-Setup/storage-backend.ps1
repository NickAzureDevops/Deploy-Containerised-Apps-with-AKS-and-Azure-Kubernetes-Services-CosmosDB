$RESOURCE_GROUP_NAME='rg-tfstate'
$STORAGE_ACCOUNT_NAME="saterraformdevops"
$CONTAINER_NAME='devtfstate'

# Create resource group
New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location uksouth

# Create storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -SkuName Standard_LRS -Location uksouth -AllowBlobPublicAccess $true

# Create blob container
New-AzStorageContainer -Name $CONTAINER_NAME -Context $storageAccount.context -Permission blob