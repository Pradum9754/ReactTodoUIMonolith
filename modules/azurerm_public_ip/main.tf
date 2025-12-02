resource "azurerm_public_ip" "todo_pip" {
  for_each            = var.todo_public_ip
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  allocation_method   = each.value.allocation_method
  ip_version          = each.value.ip_version
  tags                = each.value.tags
}
