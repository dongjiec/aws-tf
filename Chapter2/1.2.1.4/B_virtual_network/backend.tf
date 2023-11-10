terraform {
  backend "azurerm" {
    resource_group_name  = "CloudNativeAzure-group"
    storage_account_name = "cnabookprodtf"
    container_name       = "cloud-native-devs"
    key                  = "Virtual_network"
  }
}
