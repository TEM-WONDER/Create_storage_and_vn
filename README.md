# Create_storage_and_vn
The repo uses Bicep to provision a storage and virtual network resource in Azure
# Azure Bicep Deployment: Storage Account and Virtual Network

This repository contains an Azure Bicep template and a bash script to automate the deployment of:

- An **Azure Storage Account**
- An **Azure Virtual Network** with two subnets

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Files Included](#files-included)
- [Deployment Instructions](#deployment-instructions)
- [Resources Deployed](#resources-deployed)
- [Parameters](#parameters)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Overview

The project automates the deployment of essential Azure resources using Bicep templates and a bash script. It simplifies the process of provisioning infrastructure in Azure, making it easier to manage and reproduce deployments.

## Prerequisites

- **Azure CLI** installed and logged in ([Installation Guide](https://learn.microsoft.com/cli/azure/install-azure-cli)).
- **Bicep CLI** installed ([Installation Guide](https://learn.microsoft.com/azure/azure-resource-manager/bicep/install)).
- An **Azure Resource Group** created where the resources will be deployed.
- **Bash Shell** to run the deployment script.

## Files Included

- `main.bicep`: The Bicep template defining the resources to deploy.
- `deploy.sh`: A bash script to automate the deployment process.
- `parameters.json`: (Optional) A JSON file containing parameter values.
- `.gitignore`: Specifies intentionally untracked files to ignore.

## Deployment Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/TEM-WONDER/your-repo-name.git
cd your-repo-name
```

### 2. Modify Parameters (Optional)

If you wish to change the default parameters, you can edit the `parameters.json` file or update the variables in the `deploy.sh` script.

### 3. Ensure the Script is Executable

Make sure the `deploy.sh` script has execute permissions:

```bash
chmod +x deploy.sh
```

### 4. Run the Deployment Script

Execute the script to deploy the resources:

```bash
./deploy.sh
```

### 5. Verify the Deployment

After the script finishes executing, you can verify the deployed resources via the Azure Portal or using Azure CLI commands:

```bash
az storage account show --name <storageAccountName> --resource-group <resourceGroupName>
az network vnet show --name examplevnet --resource-group <resourceGroupName>
```

## Resources Deployed

### Virtual Network

- **Type:** `Microsoft.Network/virtualNetworks@2019-11-01`
- **Name:** `examplevnet`
- **Location:** Specified by the `location` parameter
- **Address Space:** `10.0.0.0/16`
- **Subnets:**
  - `Subnet-1` with address prefix `10.0.0.0/24`
  - `Subnet-2` with address prefix `10.0.1.0/24`

### Storage Account

- **Type:** `Microsoft.Storage/storageAccounts@2023-05-01`
- **Name:** Specified by the `storageAccountName` parameter
- **Location:** `'eastus'`
- **Kind:** `'StorageV2'`
- **SKU:** `'Standard_LRS'`

## Parameters

- **`storageAccountName`** (string)
  - **Description:** Name of the Storage Account to create.
  - **Constraints:** 3 to 24 characters; lowercase letters and numbers only.
  - **Default Value:** `'store${uniqueString(resourceGroup().id)}'`
- **`location`** (string)
  - **Description:** Location for the Virtual Network.
  - **Default Value:** The location of the resource group.

## Customization

You can customize the deployment by modifying the following:

### In `deploy.sh` Script:

- **`DEPLOYMENT_NAME`**: Change the deployment name.
- **`RESOURCE_GROUP`**: Specify the resource group name.
- **`STORAGE_ACCOUNT_NAME`**: Provide a custom storage account name (must be unique across Azure).
- **`LOCATION`**: Change the Azure region.

### In `main.bicep` File:

- **Virtual Network Name and Address Space**: Modify the `name` and `addressSpace` properties.
- **Subnets**: Adjust the `subnets` array to add, remove, or change subnets.
- **Storage Account Settings**: Update the `sku` or `kind` properties as needed.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any improvements.

## License

This project is licensed under the [MIT License](LICENSE).

---


## Notes

- **Storage Account Name Uniqueness**: The storage account name must be unique across Azure. If you encounter an error regarding name availability, consider changing the `STORAGE_ACCOUNT_NAME` variable in the `deploy.sh` script.

- **Parameter File (`parameters.json`)**: If you prefer to use a parameter file instead of inline parameters, ensure the `parameters.json` file is properly formatted and placed in the same directory.

- **Azure Subscription**: If you're working with multiple Azure subscriptions, uncomment and modify the `az account set` command in the `deploy.sh` script to specify the correct subscription.

- **Login to Azure**: If you're not already logged in via Azure CLI, you can uncomment the `az login` command in the script or log in manually before running the script.

---

## Contact

For any questions or support, please open an issue in the repository.