output "todo_app_rg_ids" {
  value = module.rg_module.todo_app_rg_ids
}

output "vnet_ids" {
  value = module.vnet_sub_module.vnet_ids
}

output "subnet_ids" {
  value = module.vnet_sub_module.subnet_ids
}


output "todo_app_nsg_ids" {
  value = module.nsg_module.todo_app_nsg_ids
}

output "todo_app_public_ip_ids" {
  value = module.pip_module.todo_app_pip_ids
}

output "todo_app_nic_ids" {
  value = module.nic_module.todo_app_nic_ids
}

output "todo_app_vm_ids" {
  value = module.vm_module.todo_app_vm_ids
}

