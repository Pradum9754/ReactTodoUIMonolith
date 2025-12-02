variable "network_interface" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    tags                = map(string)
    vnet_key            = string
    ip_configurations   = map(object({
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
