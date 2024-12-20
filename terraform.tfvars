# Location and resource group
location            = "Norway East" # Set to an appropriate location
resource_group_name = "AK2-rg" # Set an appropriate name

# Admin credentials
admin_username      = "administratos" # Set to an appropriate username (must match playbook.yml and install_mariadb.sh, see README)
admin_password      = "Password123!" # Set to an appropriate password (must match playbook.yml and install_mariadb.sh, see README)

# VM sizes
web_vm_size         = "Standard_B1s"
db_vm_size          = "Standard_B1ms"

# VM names and count
web_vm_name         = "web-server"
vm_count            = 2
db_vm_name          = "db-server"

# Network configuration
vnet_name           = "vnet" # Name of the virtual network
address_space       = ["10.0.0.0/16"] # Change to the desired address space
db_subnet_prefix    = "10.0.0.0/24" # Change to the desired subnet prefix for the database
web_subnet_prefix   = "10.0.1.0/24" # Change to the desired subnet prefix for the web server

# Install script URL
install_script_url  = "mariadbinstall5"