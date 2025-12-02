output "todo_app_pip_ids" {
  value = {
    for k, v in azurerm_public_ip.todo_pip : k => v.id
  }
}