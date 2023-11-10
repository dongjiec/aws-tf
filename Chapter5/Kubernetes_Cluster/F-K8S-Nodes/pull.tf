data "terraform_remote_state" "k8s_loadbalancer"{
  backend = "azurerm"
  config  = {
    storage_account_name = "cnabookprod"
    resource_group_name = "K8Scluster"
    container_name = "k8s-cluster-dev"
    key = "K8S-API-Public-loadbalancer"
  }
}



data "terraform_remote_state" "k8s_vnet"{
  backend = "azurerm"
  config  = {
    storage_account_name = "cnabookprod"
    resource_group_name = "K8Scluster"
    container_name = "k8s-cluster-dev"
    key = "Virtual_Network"
  }
}



data "terraform_remote_state" "k8s_public_ip"{
  backend = "azurerm"
  config  = {
    storage_account_name = "cnabookprod"
    resource_group_name = "K8Scluster"
    container_name = "k8s-cluster-dev"
    key = "K8S_Public_IP"
  }
}
