resource "azurerm_network_interface" "todo_app_nic" {
  for_each = var.network_interface

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name                          = ip_configuration.value.name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation

      subnet_id = var.vnet_subnet_ids[
        each.value.vnet_key
        ][
        ip_configuration.value.subnet_key
      ]


      public_ip_address_id = try(ip_configuration.value.public_ip_address_id, null)
    }
  }
}
