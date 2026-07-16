# 🚀 TerraWeek Challenge - Day 6

## 📅 Date

**Friday, 17th July 2026**

## 📖 Topic

**Advanced Terraform + Capstone Project**

---

# 🎯 Learning Goals

* Manage multiple environments with Terraform Workspaces.
* Automatically format, validate, and test Terraform configurations.
* Perform security scanning before deployment.
* Automate Terraform using GitHub Actions.
* Follow production-ready Terraform best practices.

---

# 📝 Task 1 – Terraform Workspaces

## What are Workspaces?

Terraform Workspaces allow multiple isolated state files for the same Terraform configuration.

Examples:

* dev
* staging
* prod

Each workspace maintains its own infrastructure state.

---

## Commands Used

```bash
terraform workspace list
terraform workspace new staging
terraform workspace select staging
terraform workspace show
```

---

## Workspace-Based Configuration

```hcl
locals {
  instance_type = terraform.workspace == "prod" ? "t3.medium" : "t3.micro"
}
```

* `prod` → larger instance
* `dev/staging` → smaller instance

---

## Workspaces vs Separate Directories

### Workspaces

* Easy for simple environments.
* Shared codebase.
* Quick environment switching.

### Separate Directories/Backends

* Better isolation.
* Separate permissions.
* Easier large-scale management.

---

# 📝 Task 2 – Quality Gates

## Terraform Format

```bash
terraform fmt -recursive
```

Formats all Terraform files automatically.

---

## Terraform Validate

```bash
terraform validate
```

Checks configuration syntax and provider requirements.

---

## Native Terraform Tests

Used the Terraform test framework (Terraform 1.6+).

Run:

```bash
terraform test
```

### Test Results

* ✅ dev uses `t3.micro`
* ✅ prod uses `t3.medium`
* ✅ generated names have correct prefix
* ✅ invalid environments are rejected

---

## Plan vs Apply Tests

### Plan-Based Test

* Does not create infrastructure.
* Fast and safe.
* Validates logic.

### Apply-Based Test

* Creates temporary resources.
* Validates real outputs.
* Cleans up automatically.

---

# 📝 Task 3 – Security Scanning

Used **Trivy** to scan Terraform configuration.

Command:

```bash
trivy config .
```

Purpose:

* Detect security misconfigurations.
* Check for risky Terraform settings.
* Shift security checks left.

---

# 📝 Task 4 – GitHub Actions CI/CD

Created:

```text
.github/workflows/terraform.yml
```

The workflow runs automatically on every push and pull request.

## Steps

### Checkout

Downloads repository code.

### Setup Terraform

Installs Terraform 1.15.x.

### Terraform Format Check

Ensures code is properly formatted.

### Terraform Init

Initializes providers and modules.

### Terraform Validate

Validates Terraform configuration.

### Terraform Test

Runs native Terraform tests.

### Security Scan

Runs Trivy against Terraform code.

---

# 📝 Task 5 – Best Practices Implemented

| Practice                  | Implemented |
| ------------------------- | ----------- |
| Remote state with locking | ✅ Day 4     |
| No `.tfstate` in Git      | ✅           |
| Terraform version pinning | ✅           |
| Provider version pinning  | ✅           |
| Reusable modules          | ✅ Day 5     |
| Consistent naming/tagging | ✅           |
| No hard-coded secrets     | ✅           |
| `fmt` + `validate`        | ✅           |
| Terraform tests           | ✅           |
| Security scan             | ✅           |
| GitHub Actions CI         | ✅           |
| Clean `terraform destroy` | ✅           |

---

# 🏗️ Capstone Project

## Project

**Production-Ready Terraform Development Workflow**

The capstone demonstrates a complete Terraform workflow:

* Modular Infrastructure
* Remote State Management
* Environment Isolation
* Automated Testing
* Security Scanning
* CI/CD Automation

---

## Architecture

```text
Developer
   ↓
GitHub Push / PR
   ↓
GitHub Actions
   ├── terraform fmt -check
   ├── terraform init
   ├── terraform validate
   ├── terraform test
   └── trivy config
   ↓
Validated & Secure Terraform Code
```

---

# 📂 Project Structure

```text
DAY6/
│
├── README.md
├── example/
│   ├── main.tf
│   ├── terraform.tf
│   ├── tests/
│   │   └── basic.tftest.hcl
│   └── .github/
│       └── workflows/
│           └── terraform.yml
│
└── screenshots/
```

---

# 📚 Commands Used

```bash
terraform init
terraform validate
terraform fmt -recursive
terraform test
terraform workspace list
terraform workspace new staging
terraform workspace show
trivy config .
```

---

# 📷 Screenshots

Available in the **screenshots/** folder:

* Terraform Init
* Terraform Validate
* Terraform Test
* Terraform Workspace
* Trivy Scan
* GitHub Actions Success

---

# 💡 Key Learnings

* Learned Terraform Workspaces.
* Used `terraform.workspace` for environment-based configuration.
* Ran native Terraform tests.
* Understood plan vs apply testing.
* Performed security scanning with Trivy.
* Automated Terraform using GitHub Actions.
* Implemented Terraform best practices.
* Built a production-ready Terraform workflow.

---

# 🎓 TerraWeek Challenge Completed

* ✅ Day 1 – Terraform Basics
* ✅ Day 2 – HCL, Variables & Expressions
* ✅ Day 3 – Providers & Cloud Infrastructure
* ✅ Day 4 – State & Remote Backends
* ✅ Day 5 – Modules
* ✅ Day 6 – Advanced Terraform + Capstone

---

# 👨‍💻 Author

**Aditya Nivalkar**

**TerraWeek Challenge - Day 6 (Finale)**

---

# 🔖 Tags

#TrainWithShubham #TerraWeekChallenge #Terraform #AWS #DevOps #InfrastructureAsCode #GitHubActions #Security #CI/CD
