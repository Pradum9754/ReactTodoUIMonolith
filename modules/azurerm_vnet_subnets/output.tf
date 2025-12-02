output "subnet_ids" {
  value = {
    for vnet_key, vnet_val in azurerm_virtual_network.todo_app_vnet_sub :
    vnet_key => {
      for subnet in vnet_val.subnet :
      subnet.name => subnet.id
    }
  }
}

output "vnet_ids" {
  value = { for k, v in azurerm_virtual_network.todo_app_vnet_sub : k => v.id }
}
