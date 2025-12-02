output "todo_app_vm_ids" {
  value = {
    for vm_key, vm_val in azurerm_linux_virtual_machine.todo_vm :
    vm_key => vm_val.id
  }
}
