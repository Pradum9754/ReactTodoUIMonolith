module "rg_module" {
  source  = "../../modules/azurerm_resource_group"
  rg_todo = var.rg_todo
}

module "vnet_sub_module" {
  depends_on        = [module.rg_module]
  source            = "../../modules/azurerm_vnet_subnets"
  todo_app_vnet_sub = var.todo_app_vnet_sub
}

module "nsg_module" {
  depends_on   = [module.vnet_sub_module]
  source       = "../../modules/azurerm_network_security_group"
  todo_app_nsg = var.todo_app_nsg
}

module "pip_module" {
  depends_on     = [module.rg_module]
  source         = "../../modules/azurerm_public_ip"
  todo_public_ip = var.todo_public_ip
}


module "nic_module" {
  source            = "../../modules/azurerm_network_interface"
  network_interface = var.network_interface
  vnet_subnet_ids   = module.vnet_sub_module.subnet_ids
  depends_on        = [module.vnet_sub_module, module.nsg_module, module.pip_module]
}

module "vm_module" {
  depends_on      = [module.nic_module]
  source          = "../../modules/azurerm_virtual_machine"
  nic_ids         = module.nic_module.todo_app_nic_ids
  virtual_machine = var.virtual_machine
}

