terraform { 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.60.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "677bcc02-a3a7-468e-b9ce-5f51cdc6a6c7"
    client_id       = "be478fa1-480d-44b4-8b9f-87ba12efd40b"
    client_secret   = "Sd-4K--6YG9f0~0d7Y9StbtI84_hQ.wm7G"
    tenant_id       = "b36ac463-b379-4752-9185-dcb045b3bea2"
    features{}
    }
    
resource "azurerm_resource_group" "demo" {
  name     = "ManojResource"
  location = "West US"
}

resource "azurerm_storage_account" "demo" {
  name                     = "storageaccounttrail012"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_container" "demo" {
  name                  = "container-01"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "private"
}