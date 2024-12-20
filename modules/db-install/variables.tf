# Name of the resource group
variable "resource_group_name" {
  type = string
}

# Location of the resources
variable "location" {
  type = string
}

# URL to the MariaDB installation script
variable "install_script_url" {
  description = "URL to the MariaDB installation script"
  type        = string
  default     = "mariadbinstall"
}