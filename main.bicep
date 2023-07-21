
param pResourceName string = uniqueString(resourceGroup().id)

param pLocationName string = 'eastus'

var vStorageKindName = 'StorageV2'
var vStorageSKUName = 'Standard_LRS'
var vStorageAccessTierName = 'Hot'


resource rStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'sa${pResourceName}'
  location: pLocationName
  sku: {
    name: vStorageSKUName
  }
  kind: vStorageKindName
  properties: {
    accessTier: vStorageAccessTierName
    supportsHttpsTrafficOnly: true
  }
}
resource rAppServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'asp${pResourceName}'
  location: pLocationName
  sku:{
    name: 'F1'
  }
}

resource rAppServiceApp 'Microsoft.Web/sites@2022-09-01' = {
  name: 'asa${pResourceName}'
  location: pLocationName
  properties: {
    serverFarmId: rAppServicePlan.id
    httpsOnly:true
  }
}

output oAppServiceAppHostName string = rAppServiceApp.properties.defaultHostName
output oStorageAccountPrimaryLocation string = rStorageAccount.properties.primaryLocation
