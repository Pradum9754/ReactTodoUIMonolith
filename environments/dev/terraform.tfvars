rg_todo = {
  rg_todo_app = {
    rg_name    = "rg-todo-app-dev"
    location   = "centralindia"
    managed_by = "pradum"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
}

todo_app_vnet_sub = {
  todo_vnet = {
    vnet_name           = "vnet-todo-app-dev"
    location            = "centralindia"
    resource_group_name = "rg-todo-app-dev"
    address_space       = ["10.0.0.0/16"]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    subnets = {
      frontend_sub = {
        subnet_name      = "frontend-sub-dev"
        address_prefixes = ["10.0.1.0/24"]
      }
      backend_sub = {
        subnet_name      = "backend-sub-dev"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}


todo_app_nsg = {
  frontend_nsg = {
    nsg_name            = "todo-frontend-nsg-dev"
    location            = "centralindia"
    resource_group_name = "rg-todo-app-dev"

    security_rules = [
      {
        name                       = "todo-frontend-allow-dev-inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }

  backend_nsg = {
    nsg_name            = "todo-backend-nsg-dev"
    location            = "centralindia"
    resource_group_name = "rg-todo-app-dev"

    security_rules = [
      {
        name                       = "todo-backend-allow-dev-outbound"
        priority                   = 100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
}

todo_public_ip = {
  todo_frontend_pip = {
    pip_name            = "todo-frontend-pip-dev"
    resource_group_name = "rg-todo-app-dev"
    location            = "centralindia"
    sku                 = "Standard"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }

  todo_backend_pip = {
    pip_name            = "todo-backend-pip-dev"
    resource_group_name = "rg-todo-app-dev"
    location            = "centralindia"
    sku                 = "Standard"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
}



network_interface = {
  todo_nic = {
    nic_name            = "nic-todo-app-dev"
    location            = "centralindia"
    resource_group_name = "rg-todo-app-dev"
    vnet_key            = "todo_vnet"

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    ip_configurations = {
      frontend_ipconfig = {
        name                          = "ipconfig-frontend"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "frontend-sub-dev" # ⚠️ change from frontend-sub-dev to frontend_sub
        public_ip_address_id          = null
      }
    }
  }

  todo_backend_nic = {
    nic_name            = "nic-todo-backend-dev"
    location            = "centralindia"
    resource_group_name = "rg-todo-app-dev"
    vnet_key            = "todo_vnet"

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    ip_configurations = {
      backend_ipconfig = {
        name                          = "ipconfig-backend"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "backend-sub-dev" # ⚠️ change from backend-sub-dev to backend_sub
        public_ip_address_id          = null
      }
    }
  }
}


virtual_machine = {
  frontend_vm = {
    vm_name             = "todo-vm-frontend"
    resource_group_name = "rg-todo-app-dev"
    location            = "centralindia"
    vm_size             = "Standard_B2ms"
    admin_username      = "Pradum9754"
    admin_password      = "Praboss@9754020"
    nic_key             = "todo_nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    # source_image_reference = {
    #   publisher = "Canonical"
    #   offer     = "UbuntuServer"
    #   sku       = "20.04-LTS"
    #   version   = "latest"
    # }

    source_image_reference = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "20_04-lts"   
  version   = "latest"
}
  }

  backend_vm = {
    vm_name             = "todo-vm-backend"
    resource_group_name = "rg-todo-app-dev"
    location            = "centralindia"
    vm_size             = "Standard_B2ms"
    admin_username      = "Pradum9754"
    admin_password      = "Praboss@9754020"
    nic_key             = "todo_backend_nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    # source_image_reference = {
    #   publisher = "Canonical"
    #   offer     = "UbuntuServer"
    #   sku       = "16.04-LTS"
    #   version   = "latest"
    # }

source_image_reference = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16_04-lts-gen2"
  version   = "16.04.202109281"
}



  }
}
