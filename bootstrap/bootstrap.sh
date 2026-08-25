#!/bin/bash
set -e

RESOURCE_GROUP_NAME="terraform-state-rg"
tf_SA_ACCOUNT="tfstateradwan2026"
LOCATION="eastus"
CONTAINER_NAME="terraform-state"
APP_RESOURCE_GROUP_NAME="rg-threat-composer"

# Create Resource Group for Terraform state
az group create --name "$RESOURCE_GROUP_NAME" --location "$LOCATION"

# Create Resource Group for the actual app resources (ACR, Container App, Key Vault, etc.)
az group create --name "$APP_RESOURCE_GROUP_NAME" --location "$LOCATION"

# Create Storage Account
az storage account create \
  --name "$tf_SA_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --public-network-access Enabled

# Create Storage Container (only if it doesn't already exist)
if az storage container show --name "$CONTAINER_NAME" --account-name "$tf_SA_ACCOUNT" &>/dev/null; then
  echo "Container '$CONTAINER_NAME' already exists, skipping creation."
else
  az storage container create --name "$CONTAINER_NAME" --account-name "$tf_SA_ACCOUNT"
fi