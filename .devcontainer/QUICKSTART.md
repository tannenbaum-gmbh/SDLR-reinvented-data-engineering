# Quick Start Guide

Get up and running with the Data Engineering & IaC DevContainer in minutes!

## Prerequisites

Before you begin, ensure you have:

- [ ] [Visual Studio Code](https://code.visualstudio.com/) installed
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running
- [ ] [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed in VS Code
- [ ] At least 8GB RAM available for Docker
- [ ] 10GB free disk space

## Step 1: Clone the Repository

```bash
git clone https://github.com/tannenbaum-gmbh/SDLR-reinvented-data-engineering.git
cd SDLR-reinvented-data-engineering
```

## Step 2: Open in VS Code

```bash
code .
```

Or open VS Code and use `File` → `Open Folder` to select the repository directory.

## Step 3: Reopen in Container

When VS Code opens, you should see a notification in the bottom-right:

> **Folder contains a Dev Container configuration file. Reopen folder to develop in a container.**

Click **"Reopen in Container"**.

Alternatively, you can:
1. Press `F1` or `Ctrl+Shift+P` (Cmd+Shift+P on Mac)
2. Type: `Remote-Containers: Reopen in Container`
3. Press Enter

## Step 4: Wait for Container to Build

The first time you open the container, it will take 5-10 minutes to:
- Download the base image
- Install all tools (Terraform, Bicep, Azure CLI, etc.)
- Install Python packages (pandas, numpy, PySpark, etc.)
- Set up MSSQL Server
- Configure the environment

You can watch the progress in the VS Code terminal.

☕ Grab a coffee while it builds!

## Step 5: Verify Installation

Once the container is ready, open a new terminal in VS Code and run:

```bash
# Check Terraform
terraform version

# Check Bicep
bicep --version

# Check Azure CLI
az version

# Check GitHub CLI
gh --version

# Check Python
python --version

# Check SQL Server tools
sqlcmd -?
```

All commands should return version information.

## Step 6: Connect to MSSQL Server

The devcontainer includes a local MSSQL Server instance.

### Using sqlcmd (Command Line)

```bash
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd'
```

Then try a simple query:
```sql
SELECT @@VERSION;
GO
```

Type `EXIT` to quit sqlcmd.

### Using VS Code MSSQL Extension

1. Press `Ctrl+Shift+P` (Cmd+Shift+P on Mac)
2. Type: `MSSQL: Connect`
3. Select **"Local MSSQL"** from the list
4. Enter password: `YourStrong!Passw0rd`
5. Press Enter

You should now see the server in the MSSQL extension sidebar.

## Step 7: Authenticate with Cloud Services

### Azure CLI

```bash
az login
```

This will open a browser window for you to sign in with your Azure credentials.

### GitHub CLI

```bash
gh auth login
```

Follow the prompts to authenticate with GitHub.

## Step 8: Explore Sample Directories

The post-create script automatically created sample directories:

```bash
ls -la
```

You should see:
- `terraform/` - For Terraform configurations
- `bicep/` - For Bicep templates
- `sql/` - For SQL scripts
- `notebooks/` - For Jupyter notebooks
- `pipelines/` - For data pipelines
- `data/` - For sample data

## Your First Tasks

### Create a Simple Terraform Configuration

```bash
cd terraform
cat > main.tf << 'EOF'
terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example-dev"
  location = "East US"
}
EOF

terraform init
terraform validate
terraform plan
```

### Create a Simple Bicep Template

```bash
cd ../bicep
cat > main.bicep << 'EOF'
param location string = resourceGroup().location
param storageAccountName string = 'stexample${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountId string = storageAccount.id
EOF

az bicep build --file main.bicep
```

### Create a Simple SQL Script

```bash
cd ../sql
cat > create_database.sql << 'EOF'
-- Create a sample database
CREATE DATABASE SampleDB;
GO

USE SampleDB;
GO

-- Create a sample table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

-- Insert sample data
INSERT INTO Customers (FirstName, LastName, Email)
VALUES 
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Bob', 'Johnson', 'bob.johnson@example.com');
GO

-- Query the data
SELECT * FROM Customers;
GO
EOF

sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd' -i create_database.sql
```

### Create a Simple Jupyter Notebook

```bash
cd ../notebooks
```

Start Jupyter Lab:
```bash
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser
```

VS Code will automatically forward port 8888. Click the link in the terminal or navigate to http://localhost:8888.

Create a new Python 3 notebook and try:

```python
import pandas as pd
import numpy as np

# Create sample data
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David'],
    'Age': [25, 30, 35, 40],
    'City': ['New York', 'London', 'Paris', 'Tokyo']
}

df = pd.DataFrame(data)
print(df)
```

### Test Data Engineering Libraries

Create a Python script to test the data stack:

```bash
cd /workspace
cat > test_data_stack.py << 'EOF'
import pandas as pd
import numpy as np
from sqlalchemy import create_engine
import pyodbc

print("✓ pandas version:", pd.__version__)
print("✓ numpy version:", np.__version__)
print("✓ sqlalchemy imported successfully")
print("✓ pyodbc imported successfully")

# Test MSSQL connection
try:
    conn_str = (
        'DRIVER={ODBC Driver 18 for SQL Server};'
        'SERVER=localhost;'
        'UID=sa;'
        'PWD=YourStrong!Passw0rd;'
        'TrustServerCertificate=yes;'
    )
    conn = pyodbc.connect(conn_str)
    print("✓ Connected to MSSQL Server successfully")
    conn.close()
except Exception as e:
    print("✗ MSSQL connection failed:", e)

print("\n🎉 Data engineering stack is ready!")
EOF

python test_data_stack.py
```

## Next Steps

### Learn More
- Read the [DevContainer README](.devcontainer/README.md) for detailed documentation
- Review [ARCHITECTURE.md](.devcontainer/ARCHITECTURE.md) to understand the setup
- Check out the [main README](../README.md) for project overview

### Customize Your Environment
- Add more VS Code extensions in `devcontainer.json`
- Install additional Python packages: `pip install <package>`
- Install additional tools in `Dockerfile`

### Start Building
- Create your first data pipeline
- Write Terraform configurations for Azure
- Build Bicep templates
- Develop SQL stored procedures
- Create analytical notebooks

### Get Help
- Check the [Troubleshooting section](README.md#troubleshooting) in the DevContainer README
- Review Docker logs: `docker logs <container-id>`
- Open an issue on GitHub

## Common Commands Reference

### Container Management
```bash
# Rebuild container (after changing Dockerfile or devcontainer.json)
# Use Command Palette: "Remote-Containers: Rebuild Container"

# Close container
# Use Command Palette: "Remote-Containers: Reopen Folder Locally"
```

### Cloud CLI
```bash
# Azure
az login                          # Login to Azure
az account list                   # List subscriptions
az group list                     # List resource groups

# GitHub
gh auth status                    # Check authentication status
gh repo list                      # List your repositories
gh issue list                     # List issues
```

### Infrastructure
```bash
# Terraform
terraform init                    # Initialize Terraform
terraform plan                    # Create execution plan
terraform apply                   # Apply changes
terraform destroy                 # Destroy resources

# Bicep
az bicep build --file main.bicep  # Build Bicep to ARM template
az deployment group create ...    # Deploy Bicep template
```

### Database
```bash
# sqlcmd
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd'
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd' -i script.sql
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd' -Q "SELECT @@VERSION"
```

### Data Engineering
```bash
# Python
python script.py                  # Run Python script
pip install package               # Install Python package
pip list                          # List installed packages

# Jupyter
jupyter lab                       # Start Jupyter Lab
jupyter notebook                  # Start Jupyter Notebook
```

## Tips & Tricks

### 1. Use GitHub Copilot
The devcontainer includes GitHub Copilot. Use it to:
- Generate Terraform resources
- Write SQL queries
- Create Python data pipelines
- Generate Bicep templates

Just start typing and let Copilot suggest code!

### 2. Use Terminal Shortcuts
- `Ctrl+` \` : Toggle terminal
- `Ctrl+Shift+` \` : New terminal
- Split terminals for parallel work

### 3. Use VS Code Features
- `Ctrl+P`: Quick file open
- `Ctrl+Shift+F`: Search across files
- `F12`: Go to definition
- `Shift+F12`: Find all references

### 4. Persist Data
MSSQL data is persisted in a Docker volume named `mssql-data`. This survives container rebuilds.

To completely reset MSSQL:
```bash
docker volume rm sdlr-reinvented-data-engineering_mssql-data
```

### 5. Use Environment Variables
Create a `.env` file in the repository root:
```bash
AZURE_SUBSCRIPTION_ID=your-sub-id
AZURE_TENANT_ID=your-tenant-id
```

This is automatically loaded in the devcontainer.

## Success!

You're now ready to build data engineering solutions and infrastructure as code in a fully-configured development environment! 🚀

Happy coding! 🎉
