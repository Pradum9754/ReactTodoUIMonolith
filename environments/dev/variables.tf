variable "rg_todo" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "todo_app_vnet_sub" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
    subnets = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}


variable "todo_app_nsg" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "todo_public_ip" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    sku                 = string
    allocation_method   = string
    ip_version          = optional(string)
    tags                = optional(map(string))
  }))
}

variable "network_interface" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    tags                = map(string)
    vnet_key            = string
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
      subnet_key                    = string
      public_ip_address_id          = optional(string)
    }))
  }))
}

variable "vnet_subnet_ids" {
  type    = map(map(string))
  default = {} 
}

variable "virtual_machine" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    vm_size             = string
    admin_username      = string
    admin_password      = string
    nic_key             = string
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "nic_ids" {
  type    = map(string)
  default = {} 
}



