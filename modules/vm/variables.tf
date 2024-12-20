# Name of the virtual machine
variable "vm_name" {
  type        = string
  description = "Navnet på VM-en"
  default     = "myVM"
}

# Location of the resource group
variable "location" {
  type        = string
  default     = "US east"
  description = "Location of the resource group."
}

# Name of the resource group
variable "resource_group_name" {
  type        = string
  description = "Navnet på ressursgruppen"
}

# ID of the subnet for the virtual machine
variable "subnet_id" {
  type        = string
  description = "ID-en til subnettet VM-en skal være i"
}

# Size of the virtual machine
variable "vm_size" {
  type        = string
  description = "Størrelsen på VM-en"
  default     = "Standard_B1s"
}

# Admin username for the virtual machine
variable "admin_username" {
  type        = string
  description = "Admin username"
  default     = "admin"
}

# Admin password for the virtual machine
variable "admin_password" {
  type        = string
  description = "Admin Password"
  default     = "admin"
}

# Assign public IP to the virtual machine
variable "assign_public_ip" {
  type        = bool
  description = "Skal VM ha offentleg IP"
  default     = false
}

# ID of the load balancer backend pool
variable "backend_pool_id" {
  type        = string
  description = "ID of the load balancer backend pool"
  default     = null
}

# ID of the network security group
variable "nsg_id" {
  type        = string
  description = "ID of the network security group"
  default     = null
}

# Name of the storage account for scripts
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for scripts"
  default     = "MariaDBInstall"
}

# Storage account key for script access
variable "storage_account_key" {
  type        = string
  description = "Storage account key for script access"
  sensitive   = true
}

# Image publisher for the virtual machine
variable "image_publisher" {
  description = "Image publisher for VM"
  type        = string
  default     = "Canonical"
}

# Image offer for the virtual machine
variable "image_offer" {
  description = "Image offer for VM"
  type        = string
  default     = "ubuntu-24_04-lts"
}

# Image SKU for the virtual machine
variable "image_sku" {
  description = "Image SKU for VM"
  type        = string
  default     = "server"
}

# Image version for the virtual machine
variable "image_version" {
  description = "Image version for VM"
  type        = string
  default     = "latest"
}

# URL to the MariaDB installation script
variable "install_script_url" {
  description = "URL to the MariaDB installation script"
  type        = string
  default     = "mariadbinstall"
}