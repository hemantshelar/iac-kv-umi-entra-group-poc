terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "hftfstate"
    container_name       = "tfstate"
    key                  = "SPN_TF_IAC_KV_UMI_ENTRA_GROUP_POC.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "cffaa289-ca3b-4126-81da-eb8bc9ef39e9"
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}