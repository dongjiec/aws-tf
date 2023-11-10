terraform {
  backend "azurerm" {
    resource_group_name  = "CloudNativeAzure-group"
    storage_account_name = "cnabookprodtf"
    container_name       = "cloud-native-devs"
    key                  = "Instance_Network"
    access_key           = "DbanhzyDic6xjPwWiBoud63CwMwEwZHK5spEDaOYdezaDIfFpfgNA9dCYEnDqWKDpSNx+uDrJzom+ASt9E16HQ=="
  }
}
