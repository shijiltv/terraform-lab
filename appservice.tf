#Define providers used
provider "azurerm" {
  version = "=2.92"
  features {} #This is required for v2 of the provider even if empty or plan will fail


}

resource "azurerm_resource_group" "rg27032022" {
    name = "rg27032022"
    location = "centralus"
  
}

resource "azurerm_app_service_plan" "asp27032022" {
  name = "asp27032022"
      resource_group_name = azurerm_resource_group.rg27032022.name
    location = azurerm_resource_group.rg27032022.location
     sku {
    tier = "Standard"
    size = "S1"
  }
  kind = "Linux"
  reserved = true
   
  
}
resource "azurerm_app_service" "app27032022" {
    name = "app27032022"
    resource_group_name = azurerm_resource_group.rg27032022.name
    location = azurerm_resource_group.rg27032022.location
    app_service_plan_id = azurerm_app_service_plan.asp27032022.id

      site_config {
    linux_fx_version = "DOTNETCORE|3.1"
  }

}
