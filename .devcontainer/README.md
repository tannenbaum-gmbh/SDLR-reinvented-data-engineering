# DevContainer for Data Engineering & IaC Showcase

This devcontainer provides a complete development environment for demonstrating GHCP SDLC (GitHub Copilot Software Development Life Cycle) for data engineering and infrastructure as code.

## What's Included

### Infrastructure as Code Tools
- **Terraform**: Latest version for multi-cloud infrastructure management
- **Bicep**: Azure's native IaC language
- **Azure CLI**: Command-line tools for Azure resource management
- **PowerShell**: For advanced scripting and Azure automation

### Data Engineering Tools
- **MSSQL Server 2022**: Full SQL Server instance running in a container
- **SQL Command-line Tools**: sqlcmd for database operations
- **Python 3.11**: With comprehensive data engineering libraries
  - pandas, numpy for data manipulation
  - PySpark for big data processing
  - SQLAlchemy, pyodbc for database connectivity
  - Jupyter, JupyterLab for interactive notebooks
  - matplotlib, seaborn, plotly for visualization
  - dbt-core for data transformations
  - Great Expectations for data quality
  - Prefect, Apache Airflow for orchestration

### Microsoft Fabric Support
- Fabric VS Code extension
- Azure Synapse integration libraries
- Databricks CLI for unified analytics

### GitHub & Development Tools
- **GitHub CLI**: For GitHub operations
- **GitHub Copilot**: AI pair programmer
- **Docker**: For containerization
- **Kubernetes tools**: kubectl, helm for orchestration

## VS Code Extensions

The devcontainer includes extensions for:
- Terraform and Bicep development
- Azure resource management
- GitHub Actions and Pull Requests
- SQL database development
- Python and Jupyter notebooks
- Docker and Kubernetes
- Git management (GitLens, Git Graph)
- Markdown editing

## Getting Started

### Prerequisites
- Visual Studio Code with Remote - Containers extension
- Docker Desktop (or Docker Engine on Linux)
- Git

### Open in DevContainer

1. Clone this repository
2. Open the folder in VS Code
3. When prompted, click "Reopen in Container" (or use Command Palette: "Remote-Containers: Reopen in Container")
4. Wait for the container to build and start (first time may take several minutes)

### Initial Setup

After the container starts, you'll need to authenticate with cloud services:

#### Azure
```bash
az login
```

#### GitHub
```bash
gh auth login
```

### Connect to MSSQL Server

The devcontainer includes a local MSSQL Server instance:

**Connection Details:**
- Host: `localhost` (or `mssql` from within devcontainer)
- Port: `1433`
- User: `sa`
- Password: `YourStrong!Passw0rd`

**Using sqlcmd:**
```bash
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd'
```

**Using VS Code MSSQL Extension:**
- Open Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
- Type "MSSQL: Connect"
- Use the pre-configured "Local MSSQL" profile

### Start Jupyter Lab

```bash
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser
```

Then open http://localhost:8888 in your browser.

## Directory Structure

The post-create script automatically creates these directories:

```
/workspace/
├── terraform/     # Terraform configurations
├── bicep/        # Bicep templates
├── sql/          # SQL scripts
├── notebooks/    # Jupyter notebooks
├── pipelines/    # Data pipelines
└── data/         # Sample data files
```

## Environment Variables

Set these environment variables before starting the devcontainer:

- `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID
- `AZURE_TENANT_ID`: Your Azure tenant ID
- `GITHUB_TOKEN`: GitHub personal access token (optional, for higher API limits)

You can set these in a `.env` file in the repository root (already ignored by .gitignore).

## MCP Servers

This devcontainer is designed to work with Model Context Protocol (MCP) servers for enhanced AI-assisted development:

### Terraform MCP Server
Provides context-aware assistance for Terraform configurations.

### Azure MCP Server
Enables AI assistants to interact with Azure resources.

### GitHub MCP Server
Facilitates GitHub operations through AI assistants.

### MSSQL MCP Server
Provides database schema and query assistance.

## Customization

### Add More Extensions
Edit `.devcontainer/devcontainer.json` and add extension IDs to the `extensions` array.

### Install Additional Tools
Modify `.devcontainer/Dockerfile` to add more packages or tools.

### Add Python Packages
Create a `requirements.txt` in the repository root, and it will be automatically installed during post-create.

### Add Node Packages
Create a `package.json` in the repository root, and packages will be automatically installed during post-create.

## Troubleshooting

### Container Won't Start
- Ensure Docker Desktop is running
- Check Docker has enough resources (4GB RAM minimum, 8GB recommended)
- Try rebuilding: Command Palette → "Remote-Containers: Rebuild Container"

### MSSQL Connection Issues
- Wait for MSSQL to fully start (check with `docker logs`)
- Verify the password meets SQL Server complexity requirements
- Check port 1433 is not already in use

### Azure CLI Login Issues
- Use device code flow: `az login --use-device-code`
- Ensure you have network connectivity

## SDLC Phases Covered

### Planning
- GitHub Issues and Projects
- Documentation with Markdown

### Coding
- Infrastructure as Code with Terraform and Bicep
- Data pipelines with Python
- SQL database development
- GitHub Copilot for AI-assisted coding

### Verify
- Code scanning and security analysis
- Infrastructure validation with Terraform plan
- SQL query testing
- Data quality checks with Great Expectations

### Deployment
- Azure deployment with Bicep/Terraform
- GitHub Actions for CI/CD
- Container deployments with Docker/Kubernetes

### Operation
- Monitoring with Azure tools
- Database management with MSSQL
- Data pipeline orchestration
- Infrastructure management

## License

MIT License - See LICENSE file in repository root.
