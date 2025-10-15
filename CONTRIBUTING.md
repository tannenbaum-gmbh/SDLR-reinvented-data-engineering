# Contributing to SDLR-reinvented-data-engineering

Thank you for your interest in contributing to this project! This guide will help you get started.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/SDLR-reinvented-data-engineering.git
   cd SDLR-reinvented-data-engineering
   ```
3. **Open in DevContainer** using VS Code for a consistent development environment
4. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Using the DevContainer

This project uses a DevContainer to ensure all contributors have the same development environment. Please use the DevContainer for all development work:

1. Open the project in VS Code
2. Click "Reopen in Container" when prompted
3. Wait for the container to build (first time only)
4. Start developing!

See [.devcontainer/QUICKSTART.md](.devcontainer/QUICKSTART.md) for detailed setup instructions.

## Types of Contributions

We welcome various types of contributions:

### 1. Infrastructure as Code Examples
- Terraform configurations for common Azure resources
- Bicep templates for Azure services
- Kubernetes manifests
- Docker compose files

### 2. Data Engineering Examples
- Data pipeline implementations
- ETL/ELT workflows
- dbt transformations
- SQL stored procedures and functions
- Jupyter notebooks for data analysis

### 3. Documentation
- Tutorials and guides
- Architecture diagrams
- Best practices
- Troubleshooting tips

### 4. DevContainer Improvements
- Additional VS Code extensions
- New tools and utilities
- Configuration optimizations
- Bug fixes

## Contribution Guidelines

### Code Style

#### Terraform
- Use snake_case for resource names
- Include comments for complex logic
- Use variables for reusable values
- Follow [Terraform Style Guide](https://www.terraform.io/docs/language/syntax/style.html)

#### Python
- Follow PEP 8 style guide
- Use type hints where appropriate
- Write docstrings for functions and classes
- Format code with Black: `black .`
- Lint with pylint: `pylint your_file.py`

#### SQL
- Use UPPERCASE for SQL keywords
- Use snake_case for table and column names
- Include comments for complex queries
- Format consistently

### Directory Structure

Place your contributions in the appropriate directory:

```
├── terraform/          # Terraform configurations
│   ├── azure/         # Azure-specific Terraform
│   └── modules/       # Reusable Terraform modules
├── bicep/             # Bicep templates
│   └── modules/       # Reusable Bicep modules
├── sql/               # SQL scripts
│   ├── schema/        # DDL scripts
│   ├── procedures/    # Stored procedures
│   └── queries/       # Sample queries
├── notebooks/         # Jupyter notebooks
│   ├── exploration/   # Data exploration
│   └── analysis/      # Data analysis
├── pipelines/         # Data pipelines
│   ├── dbt/          # dbt projects
│   ├── prefect/      # Prefect workflows
│   └── airflow/      # Airflow DAGs
└── docs/              # Documentation
```

### Commit Messages

Write clear, descriptive commit messages:

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

Example:
```
Add Terraform module for Azure Storage Account

- Creates storage account with specified configuration
- Includes private endpoint support
- Adds network rules and RBAC assignments

Closes #123
```

### Pull Request Process

1. **Update documentation** if you're adding new features
2. **Test your changes** thoroughly in the DevContainer
3. **Ensure all files are properly formatted**
4. **Update the README** if necessary
5. **Create a Pull Request** with a clear description:
   - What changes you made
   - Why you made them
   - How to test them
   - Any additional context

### Pull Request Template

```markdown
## Description
Brief description of what this PR does

## Type of Change
- [ ] Infrastructure as Code (Terraform/Bicep)
- [ ] Data Engineering (Python/SQL/Notebooks)
- [ ] Documentation
- [ ] DevContainer improvement
- [ ] Bug fix

## Testing
Describe how you tested your changes

## Screenshots (if applicable)
Add screenshots to help explain your changes

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have tested my changes in the DevContainer
- [ ] I have updated the documentation accordingly
- [ ] My changes generate no new warnings or errors
- [ ] I have added tests that prove my fix is effective
```

## SDLC Phases

When contributing, consider how your contribution fits into the SDLC phases:

### Planning
- Open an issue to discuss your proposed changes
- Get feedback from maintainers
- Define acceptance criteria

### Coding
- Use the DevContainer for development
- Leverage GitHub Copilot for assistance
- Follow coding standards
- Write clean, maintainable code

### Verify
- Test your changes locally
- Run linters and validators:
  ```bash
  terraform validate
  az bicep build --file main.bicep
  python -m pytest
  ```
- Check for security issues

### Deployment
- Ensure your code can be deployed
- Document deployment steps
- Include example configurations

### Operation
- Consider operational aspects
- Add monitoring/logging if applicable
- Document maintenance procedures

## Development Workflow

### 1. Create Feature Branch
```bash
git checkout -b feature/my-new-feature
```

### 2. Make Changes
Develop your feature in the DevContainer with all tools available.

### 3. Test Locally
```bash
# Terraform
terraform init
terraform validate
terraform plan

# Bicep
az bicep build --file main.bicep

# Python
python -m pytest tests/
black .
pylint your_module/

# SQL
sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd' -i your_script.sql
```

### 4. Commit Changes
```bash
git add .
git commit -m "Add new feature"
```

### 5. Push to Your Fork
```bash
git push origin feature/my-new-feature
```

### 6. Create Pull Request
Go to GitHub and create a pull request from your fork to the main repository.

## Code Review Process

1. **Maintainer review**: A maintainer will review your PR
2. **Feedback**: Address any requested changes
3. **Approval**: Once approved, your PR will be merged
4. **Celebration**: Your contribution is now part of the project! 🎉

## Getting Help

- **Questions?** Open a [Discussion](https://github.com/tannenbaum-gmbh/SDLR-reinvented-data-engineering/discussions)
- **Bug found?** Open an [Issue](https://github.com/tannenbaum-gmbh/SDLR-reinvented-data-engineering/issues)
- **Need help with DevContainer?** See [.devcontainer/README.md](.devcontainer/README.md)

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. Please be respectful and considerate in your interactions.

### Our Standards

- Use welcoming and inclusive language
- Be respectful of differing viewpoints and experiences
- Gracefully accept constructive criticism
- Focus on what is best for the community
- Show empathy towards other community members

### Enforcement

Instances of unacceptable behavior may be reported by opening an issue or contacting the maintainers.

## Recognition

Contributors will be recognized in the following ways:

- Listed in the project's contributors page
- Mentioned in release notes for significant contributions
- Added to the README acknowledgments section

## Resources

- [DevContainer Documentation](.devcontainer/README.md)
- [Quick Start Guide](.devcontainer/QUICKSTART.md)
- [Architecture Overview](.devcontainer/ARCHITECTURE.md)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Azure Bicep Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)

## Thank You!

Your contributions help make this project better for everyone. We appreciate your time and effort! 🙏
