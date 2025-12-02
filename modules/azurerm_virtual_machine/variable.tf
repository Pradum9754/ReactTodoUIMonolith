variable "virtual_machine" {
  type = map(object({
    vm_name                = string
    resource_group_name    = string
    location               = string
    vm_size                = string
    admin_username         = string
    admin_password         = string
    nic_key                = string
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
  default = {}   # Terraform अब prompt नहीं करेगा
}

