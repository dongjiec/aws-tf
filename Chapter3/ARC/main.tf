resource "azurerm_resource_group" "rg" {
name = "example-resources" location = "West Europe"
}
resource "azurerm_container_registry" "acr" {
name = "containerRegistry1"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
sku = "Premium"
identity {
type = "UserAssigned"
identity_ids = [ azurerm_user_assigned_identity.example.id ]
}
encryption {
enabled = true
key_vault_key_id = data.azurerm_key_vault_key.example.id
identity_client_id = azurerm_user_assigned_identity.example.client_id
}
}
resource "azurerm_user_assigned_identity" "example" {
resource_group_name = azurerm_resource_group.example.name
location = azurerm_resource_group.example.location name = "registry-uai"
}
data "azurerm_key_vault_key" "example" {
name = "super-secret"
key_vault_id = data.azurerm_key_vault.existing.id
}