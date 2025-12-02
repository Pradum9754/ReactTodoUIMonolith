output "todo_app_nsg_ids" {
  value = { for k, v in azurerm_network_security_group.todo_nsg : k => v.id }
}
