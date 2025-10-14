#!/bin/bash
set -e

echo "Running post-create setup..."

# Install Python data engineering packages
echo "Installing Python data engineering packages..."
pip3 install --no-cache-dir \
    pandas \
    numpy \
    sqlalchemy \
    pyodbc \
    jupyter \
    jupyterlab \
    matplotlib \
    seaborn \
    plotly \
    scikit-learn \
    azure-identity \
    azure-storage-blob \
    azure-storage-file-datalake \
    azure-synapse-spark \
    pyspark \
    databricks-cli \
    great-expectations \
    dbt-core \
    dbt-sqlserver \
    prefect \
    apache-airflow

# Install additional Node.js tools
echo "Installing Node.js tools..."
npm install -g @sqltools/cli

# Install additional Python packages if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies from requirements.txt..."
    pip install -r requirements.txt
fi

# Install additional Node packages if package.json exists
if [ -f "package.json" ]; then
    echo "Installing Node dependencies from package.json..."
    npm install
fi

# Set up git safe directory
git config --global --add safe.directory /workspace

# Configure Azure CLI to use device code flow (better for devcontainers)
az config set core.allow_broker=false 2>/dev/null || true

# Verify installations
echo ""
echo "=== Environment Setup Complete ==="
echo "Terraform version: $(terraform version -json | jq -r '.terraform_version')"
echo "Azure CLI version: $(az version --output tsv 2>/dev/null | head -1)"
echo "Bicep version: $(bicep --version)"
echo "GitHub CLI version: $(gh --version | head -1)"
echo "PowerShell version: $(pwsh --version)"
echo "Python version: $(python3 --version)"
echo "Node version: $(node --version)"
echo "SQL Server tools: $(sqlcmd -? 2>&1 | head -1 || echo 'sqlcmd installed')"
echo ""
echo "=== Available Tools ==="
echo "- Terraform for infrastructure as code"
echo "- Bicep for Azure IaC"
echo "- Azure CLI for Azure management"
echo "- GitHub CLI for GitHub operations"
echo "- MSSQL Server (accessible at localhost:1433)"
echo "- Python data engineering libraries (pandas, numpy, pyspark, etc.)"
echo "- Jupyter Lab (run 'jupyter lab' to start)"
echo "- PowerShell for scripting"
echo ""
echo "=== Quick Start ==="
echo "- Connect to MSSQL: sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd'"
echo "- Azure login: az login"
echo "- GitHub login: gh auth login"
echo "- Start Jupyter: jupyter lab --ip=0.0.0.0 --port=8888 --no-browser"
echo ""

# Create sample directories
mkdir -p /workspace/terraform
mkdir -p /workspace/bicep
mkdir -p /workspace/sql
mkdir -p /workspace/notebooks
mkdir -p /workspace/pipelines
mkdir -p /workspace/data

echo "Sample directories created in /workspace"
echo "Setup complete! Happy coding!"
