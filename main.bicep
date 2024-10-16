# Description: Create a virtual network and a storage account
@minLength(3)
@maxLength(24)
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

# creates a virtual network with two subnets
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'examplevnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

# creates a storage account
resource exampleStorage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: 'eastus'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
