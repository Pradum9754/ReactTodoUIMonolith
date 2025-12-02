# output "todo_app_nic_ids" {
#   value = { for k, v in azurerm_network_interface.todo_app_nic : k => v.id }
# }

output "todo_app_nic_ids" {
  value = {
    for nic_key, nic_val in azurerm_network_interface.todo_app_nic :
    nic_key => nic_val.id
  }
}
