# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Wait for the resource group to be created
resource "time_sleep" "wait_for_rg" {
  depends_on = [azurerm_resource_group.main]
  create_duration = "10s"  
}

# Variable for the MariaDB installation script URL
variable "install_script_url" {
  description = "URL to the MariaDB installation script"
  type        = string
}

# Network module
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  web_subnet_name     = var.web_subnet_name
  web_subnet_prefix   = var.web_subnet_prefix
  db_subnet_name      = var.db_subnet_name
  db_subnet_prefix    = var.db_subnet_prefix
  depends_on          = [time_sleep.wait_for_rg]
}

# Database installation module
module "db_install" {
  source              = "./modules/db-install"
  location            = var.location
  resource_group_name = var.resource_group_name
  install_script_url  = var.install_script_url
  depends_on          = [time_sleep.wait_for_rg]
}

# Web VM module
module "web_vm" {
  source              = "./modules/vm"
  vm_name             = var.web_vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.web_subnet_id
  vm_size             = var.web_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  assign_public_ip    = true 
  nsg_id              = module.network.web_nsg_id
  storage_account_name = module.db_install.storage_account_name
  storage_account_key  = module.db_install.storage_account_key
  install_script_url  = var.install_script_url
  depends_on          = [module.db_install, time_sleep.wait_for_rg]
}

# Output the storage account name for debugging
output "debug_storage_account_name" {
  value = module.db_install.storage_account_name
}

# Output the installation script URL
output "installurl" {
  value = module.db_install.storage_account_name
}

# Database VM module
module "db_vm" {
  source              = "./modules/vm"
  count               = var.vm_count
  vm_name             = "db-server-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.db_subnet_id
  vm_size             = var.db_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  assign_public_ip    = false
  backend_pool_id     = module.loadbalancer.backend_pool_id
  storage_account_name = module.db_install.storage_account_name
  storage_account_key  = module.db_install.storage_account_key
  install_script_url   = var.install_script_url
  depends_on          = [module.db_install, time_sleep.wait_for_rg]
}

# Load balancer module
module "loadbalancer" {
  source              = "./modules/loadbalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.db_subnet_id
  depends_on          = [time_sleep.wait_for_rg]
}
