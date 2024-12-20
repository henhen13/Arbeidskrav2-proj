# Name for the Virtual Network
variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Name for the Virtual Network"
}

# Azure region
variable "location" {
  type        = string
  default     = "US east"
  description = "Azure region"
}

# Name for the resource group
variable "resource_group_name" {
  type        = string
  default     = "rg"
  description = "Name for the resource group"
}

# Network Address
variable "address_space" {
  type        = list(string)
  description = "Network Address"
  default     = [ "10.0.0.0/16" ]
}

# Name for subnet 1
variable "db_subnet_name" {
  type        = string
  description = "Name for subnet 1"
  default     = "subnet1"
}

# Address of subnet 1
variable "db_subnet_prefix" {
  type         = string
  description  = "Address of subnet 1"
  default      = "10.0.0.0/24"
}

# Name of subnet 2
variable "web_subnet_name" {
  type        = string
  description = "Name of subnet 2"
  default     = "subnet2"
}

# Address of subnet 2
variable "web_subnet_prefix" {
  type         = string
  description  = "Address of subnet 2"
  default      = "10.0.1.0/24"
}
