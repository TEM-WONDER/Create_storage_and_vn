#!/bin/bash

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI not found. Please install it before running this script."
    exit 1
fi

# Variables (modify these as needed)
DEPLOYMENT_NAME="myDeployment"
RESOURCE_GROUP="exampleRG"
TEMPLATE_FILE="main.bicep"
STORAGE_ACCOUNT_NAME="store123bicepclo"
LOCATION="eastus"

# Login to Azure (optional if already logged in)
#az login

# Set the subscription (optional)
# az account set --subscription "Your Subscription Name or ID"

# Run the deployment
az deployment group create \
  --name $DEPLOYMENT_NAME \
  --resource-group $RESOURCE_GROUP \
  --template-file $TEMPLATE_FILE \
  --parameters @parameters.json
