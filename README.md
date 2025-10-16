# SDLR-reinvented-data-engineering
Demonstrating GHCP SDLC for data engineering

## Overview

This repository showcases the complete Software Development Life Cycle (SDLC) using GitHub Copilot (GHCP) for data engineering and infrastructure as code projects. It covers all phases:

- **Planning**: Issue tracking, project management
- **Coding**: Infrastructure as Code, data pipelines, SQL development
- **Verify**: Testing, validation, security scanning
- **Deployment**: CI/CD with GitHub Actions, Azure deployments
- **Operation**: Monitoring, maintenance, and optimization

## Quick Start with DevContainer

This repository includes a pre-configured development container with all necessary tools for data engineering and infrastructure as code:

### Prerequisites
- [Visual Studio Code](https://code.visualstudio.com/)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

### Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/tannenbaum-gmbh/SDLR-reinvented-data-engineering.git
   cd SDLR-reinvented-data-engineering
   ```

2. Open in VS Code:
   ```bash
   code .
   ```

3. When prompted, click **"Reopen in Container"** (or use Command Palette: `Remote-Containers: Reopen in Container`)

4. Wait for the container to build (first time takes a few minutes)

5. Start working with all tools pre-installed!

## What's Included

The devcontainer includes:

### Infrastructure as Code
- **Terraform** - Multi-cloud infrastructure management
- **Bicep** - Azure native IaC
- **Azure CLI** - Azure resource management
- **PowerShell** - Advanced scripting

### Data Engineering
- **MSSQL Server 2022** - Full SQL Server instance
- **Python 3.11** - With pandas, numpy, PySpark, dbt, and more
- **Jupyter Lab** - Interactive notebooks
- **Data pipeline tools** - Prefect, Apache Airflow

### Microsoft Fabric & Azure
- Fabric VS Code extension
- Azure Synapse libraries
- Azure Databricks extension and CLI
- Databricks Connect for local development
- Databricks SQL connector

### Development Tools
- **GitHub CLI** - GitHub operations
- **GitHub Copilot** - AI pair programming
- **Docker & Kubernetes** - Container orchestration
- **SQL tools** - Database development

## Documentation

- [DevContainer Setup Guide](.devcontainer/README.md) - Detailed documentation about the development environment
- More documentation coming soon as we build out examples

## Project Structure

```
.
├── .devcontainer/       # DevContainer configuration
├── terraform/           # Terraform configurations
├── bicep/              # Bicep templates
├── sql/                # SQL scripts
├── notebooks/          # Jupyter notebooks
├── pipelines/          # Data pipelines
└── data/               # Sample data
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
