provider "azurerm" {
features {
     resource_group {
       prevent_deletion_if_contains_resources = false
     }
   }
 }
locals {  
    // 1. We are doing a replace on spaces in resource group name since Terraform is not supporting that currently  
    // 2. We are also truncating the rg name if it is greater than 64 characters since that is the max that Azure supports  
    rg_name = replace((length(var.resource_group_name) > 64 ? substr(var.resource_group_name, 0, 63) : var.resource_group_name), " ", "-")  
}  

resource "azurerm_resource_group" "rg" {  
    name = local.rg_name
    location = "northeurope"  
  }  

resource "azurerm_template_deployment" "demo_logic_app" {
  name                = "${var.application}"
  resource_group_name =  "${azurerm_resource_group.rg.name}" 

  template_body = "${file("template/logic-app.json")}"
   parameters = {
      deploy_timestamp = "${timestamp()}",
      name = "${var.application}",
  }
  deployment_mode = "Incremental"
}