# Terraform Project for Web Server Connected to a Database in Azure  

This Terraform project provisions:  
- A virtual machine (VM) hosting a web service.  
- Two database VMs configured behind a load balancer for redundancy.  

## Project Structure  
- `main.tf`: Main configuration file.  
- `variables.tf`: Defines variable structure.  
- `variables.tfvars`: User-editable variable values.  
- `modules/db-install/scripts/`: Scripts for provisioning and configuration.  
  - `install_mariadb.sh`: Sets up MariaDB on database VMs.  
  - `playbook.yml`: Ansible playbook for configuring the web server.  

## Setup Instructions  

### Prerequisites  
- Terraform installed. Can be done with Chocolately  
- Azure account with appropriate permissions.  
- Azure CLI installed and authenticated via `az login`.  

### Download and Configure  
1. **Download**  
   Download the project as a `.zip` file and extract it. Then open the extracted directory in powershell and initilize terraform with "terraform init"

2. **Modify Variables**  
   Update `variables.tfvars` with your environment details.  

3. **Manual Script Adjustments**  
   - Update **lines 6 and 7** in `install_mariadb.sh` to match `admin_username` and `admin_password` in `variables.tfvars`.  
   - Update **lines 64 and 65** in `playbook.yml` with the same values for `admin_username` and `admin_password`.  

## Run Terraform  

1. **Login to Azure**  
   Use the following command in PowerShell:  
   ```bash
   az login
If there are login issues, follow the instructions provided in PowerShell to resolve them.

2. **Provision Infrastructure**
   ```bash
  cd <path-to-Terraform-folder>
  terraform init
  terraform plan -out main.tfplan
  terraform apply main.tfplan
Note: If you encounter a MariaDB setup error, delete Azure resources and re-run the Terraform commands.


