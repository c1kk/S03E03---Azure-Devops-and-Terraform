provider "azurerm" {
    version = "3.0.1"
    features {}
}

# terraform {
#     backend "azurerm" {
#         resource_group_name  = "tf_rg_blobstore"
#         storage_account_name = "tfstoragebinarythistle"
#         container_name       = "tfstate"
#         key                  = "terraform.tfstate"
#     }
# }


resource "azurerm_resource_group" "terra_test" {
  name = "gr_terra"
  location = "East US"
}

resource "azurerm_container_group" "terra_test_2" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.terra_test.location
  resource_group_name       = azurerm_resource_group.terra_test.name

  ip_address_type     = "Public"
  dns_name_label      = "caokhoanguyen1"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "caokhoanguyen/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}