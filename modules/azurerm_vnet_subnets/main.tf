resource "azurerm_virtual_network" "todo_app_vnet_sub" {
  for_each            = var.todo_app_vnet_sub
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
