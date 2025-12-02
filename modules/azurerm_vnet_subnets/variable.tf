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
