variable "todo_public_ip" {
  type = map(object({
    pip_name           = string
    resource_group_name = string
    location           = string
    sku                = string
    allocation_method  = string
    ip_version         = optional(string)
    tags               = optional(map(string))
  }))
}