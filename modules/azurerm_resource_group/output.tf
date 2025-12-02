output "todo_app_rg_ids" {
  value = [for rg in azurerm_resource_group.todo_app_rg : rg.id]
}
