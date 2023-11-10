provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rg" {
  name = "cs1-tf"
  location = "East Asia"
}





