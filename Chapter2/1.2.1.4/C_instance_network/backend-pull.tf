data "terraform_remote_state" "virtual-network" {
  backend = "azurerm"
  config = {
    storage_account_name = "cnabookprodtf"
    container_name       = "cloud-native-devs"
    key                  = "Virtual_network"
    #添加访问存储账号访问密钥 (23.11.10)
    access_key = "DbanhzyDic6xjPwWiBoud63CwMwEwZHK5spEDaOYdezaDIfFpfgNA9dCYEnDqWKDpSNx+uDrJzom+ASt9E16HQ=="
  }
}
