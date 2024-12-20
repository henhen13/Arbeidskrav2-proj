# Variable for the location of the resource group
variable "location" {
  type        = string
  default     = "US east"
  description = "Location of the resource group."
}

# Variable for the name of the resource group
variable "resource_group_name" {
  type        = string
  default     = "rg"
  description = "Name of the resource group."
}

# Variable for the name of the load balancer
variable "lb_name" {
  type        = string
  description = "Name of the LB"
  default     = "db-loadbalancer"
}

# Variable for the subnet ID of the load balancer
variable "subnet_id" {
  type        = string
  description = "Loadbalancer subnet"
}
