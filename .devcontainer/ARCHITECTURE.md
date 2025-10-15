# DevContainer Architecture

## Overview

This devcontainer provides a complete, integrated development environment for data engineering and infrastructure as code projects using the GHCP SDLC approach.

## Container Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    VS Code + Extensions                      │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  • GitHub Copilot        • Azure Extensions            │ │
│  │  • Terraform             • SQL Extensions              │ │
│  │  • Bicep                 • Jupyter                     │ │
│  │  • Docker/K8s            • Git Extensions              │ │
│  └────────────────────────────────────────────────────────┘ │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ├─── Remote Connection ───┐
                           │                          │
┌──────────────────────────▼────────────┐  ┌─────────▼──────────┐
│      DevContainer Service              │  │  MSSQL Service     │
│  ┌──────────────────────────────────┐ │  │                    │
│  │  Base Tools                      │ │  │  SQL Server 2022   │
│  │  • Azure CLI                     │ │  │  Developer Edition │
│  │  • GitHub CLI                    │ │  │                    │
│  │  • Terraform                     │ │  │  Port: 1433        │
│  │  • Bicep CLI                     │ │  │  User: sa          │
│  │  • PowerShell                    │ │  │                    │
│  │  • Docker CLI                    │ │  │  Volume:           │
│  │  • kubectl/helm                  │ │  │  mssql-data        │
│  └──────────────────────────────────┘ │  └────────────────────┘
│                                        │
│  ┌──────────────────────────────────┐ │
│  │  Data Engineering Stack          │ │
│  │  • Python 3.11                   │ │
│  │  • pandas, numpy, PySpark        │ │
│  │  • SQLAlchemy, pyodbc            │ │
│  │  • Jupyter Lab                   │ │
│  │  • dbt-core, dbt-sqlserver       │ │
│  │  • Great Expectations            │ │
│  │  • Prefect, Apache Airflow       │ │
│  │  • Azure Synapse SDK             │ │
│  │  • Databricks CLI                │ │
│  └──────────────────────────────────┘ │
│                                        │
│  Network: Shared with MSSQL            │
└────────────────────────────────────────┘
```

## Connectivity Flow

```
Developer
    │
    ├─── Opens VS Code with Remote-Containers
    │
    ▼
VS Code Local
    │
    ├─── Connects to Docker
    │
    ▼
DevContainer
    │
    ├─── Mounts: /workspace
    ├─── Shared Network with MSSQL
    ├─── Port Forwards: 1433, 8888, 5000
    │
    ├─── Terraform/Bicep ──► Azure Cloud
    │
    ├─── GitHub CLI ──► GitHub API
    │
    ├─── Azure CLI ──► Azure Resources
    │
    └─── SQL Tools ──► MSSQL Container
```

## MCP Server Integration

```
┌──────────────────────────────────────────────────────────┐
│                    GitHub Copilot                         │
│                    (AI Assistant)                         │
└────────────────────┬─────────────────────────────────────┘
                     │
                     │ MCP Protocol
                     │
    ┌────────────────┼────────────────┐
    │                │                │
    ▼                ▼                ▼
┌─────────┐    ┌──────────┐    ┌──────────┐
│Terraform│    │  Azure   │    │  GitHub  │
│   MCP   │    │   MCP    │    │   MCP    │
│ Server  │    │  Server  │    │  Server  │
└────┬────┘    └────┬─────┘    └────┬─────┘
     │              │                │
     ▼              ▼                ▼
 .tf files    Azure Resources   GitHub API
 
    ┌────────────────┐
    │     MSSQL      │
    │      MCP       │
    │     Server     │
    └────┬───────────┘
         │
         ▼
    MSSQL Server
```

## SDLC Phases Coverage

### 1. Planning Phase
- **Tools**: GitHub Issues, Projects, Discussions
- **Extensions**: GitHub Pull Requests, GitHub Actions
- **Capabilities**: 
  - Issue tracking and project management
  - Roadmap planning
  - Documentation with Markdown

### 2. Coding Phase
- **Infrastructure as Code**:
  - Terraform for multi-cloud IaC
  - Bicep for Azure-native IaC
  - VS Code extensions with IntelliSense
- **Data Engineering**:
  - Python with data libraries
  - Jupyter notebooks for exploration
  - SQL development with MSSQL tools
- **AI Assistance**:
  - GitHub Copilot for code generation
  - MCP servers for context-aware suggestions

### 3. Verify Phase
- **Testing**:
  - Python unit tests
  - SQL query validation
  - Data quality checks (Great Expectations)
- **Infrastructure Validation**:
  - `terraform plan` and `terraform validate`
  - Bicep linting and validation
- **Security**:
  - Code scanning
  - Dependency scanning
  - Secret scanning

### 4. Deployment Phase
- **CI/CD**:
  - GitHub Actions workflows
  - Azure Pipelines integration
- **Infrastructure Deployment**:
  - Terraform apply
  - Bicep deployments to Azure
- **Container Deployment**:
  - Docker builds
  - Kubernetes deployments

### 5. Operation Phase
- **Monitoring**:
  - Azure Monitor integration
  - Application Insights
- **Database Management**:
  - MSSQL Server administration
  - Query performance tuning
- **Pipeline Orchestration**:
  - Prefect workflows
  - Apache Airflow DAGs
- **Infrastructure Management**:
  - Terraform state management
  - Resource monitoring

## Data Flow Example

```
Source Data
    │
    ├─── Ingestion (Python/PySpark)
    │
    ▼
MSSQL Server
    │
    ├─── Transformation (dbt)
    │
    ▼
Data Warehouse
    │
    ├─── Quality Checks (Great Expectations)
    │
    ▼
Azure Synapse / Fabric
    │
    ├─── Analytics & Reporting
    │
    ▼
Business Intelligence
```

## Directory Structure

```
/workspace/
├── .devcontainer/          # Container configuration
│   ├── devcontainer.json   # VS Code devcontainer config
│   ├── docker-compose.yml  # Multi-container setup
│   ├── Dockerfile          # Container image definition
│   ├── post-create.sh      # Setup automation
│   ├── mcp-config.json     # MCP server configuration
│   ├── README.md           # Documentation
│   └── ARCHITECTURE.md     # This file
│
├── terraform/              # Terraform IaC files
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── bicep/                  # Bicep templates
│   └── main.bicep
│
├── sql/                    # SQL scripts
│   ├── schema/
│   └── queries/
│
├── notebooks/              # Jupyter notebooks
│   └── exploration.ipynb
│
├── pipelines/              # Data pipelines
│   ├── dbt/               # dbt transformations
│   ├── prefect/           # Prefect workflows
│   └── airflow/           # Airflow DAGs
│
└── data/                   # Sample data
    └── samples/
```

## Extension Capabilities

### Terraform Extension
- Syntax highlighting
- IntelliSense
- Linting and validation
- Plan visualization

### Bicep Extension
- IntelliSense for Azure resources
- Parameter file support
- Deployment visualization

### Azure Extensions
- Resource management
- Storage operations
- Function app deployment

### GitHub Extensions
- Pull request management
- Action workflow editing
- Repository insights

### MSSQL Extension
- Query editor
- Database explorer
- Schema management
- Query results visualization

### Jupyter Extension
- Interactive notebooks
- Cell execution
- Variable inspector
- Plot rendering

## Security Considerations

1. **Secrets Management**:
   - Use `.env` for local secrets (gitignored)
   - Azure Key Vault for production secrets
   - GitHub Secrets for CI/CD

2. **Authentication**:
   - Azure CLI device code flow
   - GitHub CLI browser authentication
   - SQL Server authentication (SA password in compose file for dev only)

3. **Network Security**:
   - Containers share network for efficiency
   - Ports forwarded only when needed
   - TLS for production connections

4. **Container Security**:
   - Base image from Microsoft
   - Regular updates via features
   - Non-root user (vscode)

## Performance Optimization

1. **Volume Mounts**:
   - Cached consistency for better performance
   - SSH and Azure credentials mounted for reuse

2. **Build Caching**:
   - Docker layer caching
   - pip caching
   - npm caching

3. **Resource Allocation**:
   - Recommend 8GB RAM minimum
   - 4 CPU cores for parallel builds
   - SSD for Docker storage

## Extensibility

The devcontainer is designed to be extended:

1. **Add Extensions**: Edit `devcontainer.json` extensions array
2. **Add Tools**: Modify `Dockerfile` or use devcontainer features
3. **Add Services**: Extend `docker-compose.yml`
4. **Add MCP Servers**: Update `mcp-config.json`
5. **Custom Setup**: Enhance `post-create.sh`

## Best Practices

1. **Regular Updates**:
   - Rebuild container monthly for updates
   - Update extensions regularly
   - Keep base images current

2. **Resource Management**:
   - Clean unused Docker images
   - Monitor container resource usage
   - Use `.dockerignore` for large projects

3. **Development Workflow**:
   - Commit early and often
   - Use feature branches
   - Test in container before pushing

4. **Documentation**:
   - Document custom configurations
   - Keep README updated
   - Add inline comments for complex setup

## Troubleshooting

### Container Build Issues
- Check Docker daemon is running
- Verify network connectivity
- Review build logs for errors
- Try rebuilding without cache

### MSSQL Connection Issues
- Wait for health check to pass
- Verify port 1433 is available
- Check SA password meets requirements
- Review MSSQL container logs

### Performance Issues
- Increase Docker memory allocation
- Use volume mounts efficiently
- Close unused extensions
- Optimize workspace folder size

### Extension Issues
- Check extension compatibility
- Review VS Code logs
- Try disabling conflicting extensions
- Update VS Code and extensions
