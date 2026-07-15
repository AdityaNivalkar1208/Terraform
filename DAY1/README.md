# TerraWeek Challenge - Day 1

## Topic

Introduction to Infrastructure as Code (IaC) & Terraform Basics

---

# Task 1

## What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using code instead of manually configuring resources through a graphical interface.

### Benefits

- Automation
- Consistency
- Version Control
- Faster Deployments
- Reduced Human Errors

---

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows users to define, provision, and manage infrastructure using declarative configuration files.

### Why Terraform is Popular

- Declarative Syntax
- Provider Agnostic
- Multi-Cloud Support
- Huge Provider Ecosystem
- State Management

---

## Terraform vs Alternatives

### Terraform

Declarative, multi-cloud Infrastructure as Code tool.

### OpenTofu

Community-driven open-source fork of Terraform.

### Pulumi

Infrastructure can be written using programming languages like Java, Python, Go, and C#.

### CloudFormation

AWS-native Infrastructure as Code service.

### Ansible

Primarily used for Configuration Management and Application Deployment.

---

# Task 2

## Terraform Installation

### Version

Run

```bash
terraform version
```

### Help

```bash
terraform -help
```

Screenshots are available inside the screenshots folder.

---

# Task 3

## Terraform Terminologies

### Provider

A plugin that allows Terraform to communicate with cloud platforms or services.

Example:

```hcl
provider "local" {}
```

---

### Resource

Represents infrastructure that Terraform creates.

Example

```hcl
resource "local_file" "example" {}
```

---

### State

Stores information about the resources Terraform manages.

File:

```
terraform.tfstate
```

---

### Plan

Shows what Terraform will create, update, or destroy before applying changes.

Command

```
terraform plan
```

---

### HCL

HashiCorp Configuration Language used to write Terraform configuration.

---

### Module

Reusable Terraform configuration.

---

# Task 4

Terraform Workflow

```text
Write
↓

terraform init

↓

terraform fmt

↓

terraform validate

↓

terraform plan

↓

terraform apply

↓

terraform destroy
```

---

## Commands Executed

```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply

terraform destroy
```

---

## Screenshots

- Terraform Version
- Terraform Help
- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply
- Greeting.txt Output
- Terraform Destroy

(All screenshots are available in the screenshots folder.)

---

## Files Generated

- main.tf
- greeting.txt
- terraform.tfstate
- terraform.tfstate.backup
- .terraform.lock.hcl

---

## Learning Outcome

Today I learned the basics of Infrastructure as Code (IaC), Terraform installation, Terraform workflow, providers, resources, state management, and how to provision local resources using Terraform.
