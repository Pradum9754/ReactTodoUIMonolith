resource "azurerm_linux_virtual_machine" "todo_vm" {
  for_each = var.virtual_machine

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    var.nic_ids[each.value.nic_key]   # ✅ use map from NIC module output
  ]

os_disk {
  caching              = each.value.os_disk.caching
  storage_account_type = each.value.os_disk.storage_account_type
}

source_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16_04-lts-gen2"
  version   = "16.04.202109281"
}


}
