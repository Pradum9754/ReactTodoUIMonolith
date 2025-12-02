resource "azurerm_resource_group" "todo_app_rg" {
  for_each   = var.rg_todo
  name       = each.value.rg_name
  location   = each.value.location
  tags       = each.value.tags
}
