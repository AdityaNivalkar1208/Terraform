# 🚀 TerraWeek Challenge - Day 3

## 📅 Date
**Tuesday, 14th July 2026**

## 📖 Topic
**Providers, Resources & Your First Cloud Infrastructure (AWS)**

---

# 🎯 Learning Goals

- Configure Terraform AWS Provider
- Understand Provider Version Pinning
- Learn Resources vs Data Sources
- Work with Meta Arguments
- Deploy Infrastructure on AWS
- Understand Terraform State
- Update & Destroy Infrastructure Safely

---

# 📝 Task 1 – Providers & Version Pinning

## What is a Provider?

A **Provider** is a Terraform plugin that allows Terraform to communicate with cloud platforms such as AWS, Azure, GCP, Docker, etc.

Example:

```hcl
provider "aws" {
  region = var.aws_region
}
```

---

## Version Pinning

```hcl
terraform {

  required_version = ">= 1.10"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}
```

### Why Version Pinning?

- Ensures consistent Terraform behavior.
- Prevents unexpected breaking changes.
- Makes projects reproducible.
- Keeps all team members on compatible provider versions.

### Meaning of `~>` Operator

The `~>` operator is called the **Pessimistic Constraint Operator**.

Example:

```text
~> 6.0
```

Allows:

- 6.0
- 6.1
- 6.5

But **not**

- 7.0

---

# 📝 Task 2 – Resources vs Data Sources

## Resource

A Resource creates and manages infrastructure.

Example

```hcl
resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

}
```

---

## Data Source

A Data Source only reads existing information.

Example

```hcl
data "aws_ami" "al2023" {

  most_recent = true

}
```

---

## Difference

| Resource | Data Source |
|----------|-------------|
| Creates Infrastructure | Reads Existing Infrastructure |
| Managed by Terraform | Not Managed |
| Can Create/Delete | Read Only |

---

# 📝 Task 3 – AWS Infrastructure

Infrastructure Created

- ✅ VPC
- ✅ Public Subnet
- ✅ Internet Gateway
- ✅ Route Table
- ✅ Route Table Association
- ✅ Security Group
- ✅ EC2 Instance
- ✅ Amazon Linux 2023 AMI (Data Source)

---

## Terraform Workflow

```text
Write
   ↓
terraform init
   ↓
terraform validate
   ↓
terraform plan
   ↓
terraform apply
   ↓
terraform state list
   ↓
terraform output
   ↓
terraform destroy
```

---

# 📝 Task 4 – Meta Arguments

## count

Creates multiple identical resources.

Example

```hcl
count = 2
```

---

## for_each

Creates resources from a map or set.

Example

```hcl
for_each = toset(["dev","prod"])
```

---

## depends_on

Creates explicit dependency between resources.

Example

```hcl
depends_on = [
  aws_internet_gateway.igw
]
```

---

## lifecycle

Terraform lifecycle rules.

Example

```hcl
lifecycle {

  create_before_destroy = true

}
```

### Other lifecycle options

- create_before_destroy
- prevent_destroy
- ignore_changes

---

# 📝 Task 5 – Update & Destroy

Updated the infrastructure by modifying resource configuration and reviewed the Terraform execution plan to understand the proposed changes.

Finally destroyed all resources to avoid unnecessary AWS charges.

```bash
terraform destroy
```

---

# 📂 Files Used

- terraform.tf
- variables.tf
- main.tf
- outputs.tf

---

# 📷 Screenshots

Stored inside the **screenshots/** folder.

- AWS Configure
- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply
- Terraform State List
- Terraform Output
- AWS Console (VPC)
- AWS Console (Subnet)
- AWS Console (EC2)
- AWS Console (Security Group)
- Terraform Destroy

---

# ☁️ AWS Resources Used

- Amazon VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance
- Amazon Linux 2023 AMI

---

# 📚 Commands Used

```bash
aws configure

terraform init

terraform validate

terraform plan

terraform apply

terraform state list

terraform output

terraform destroy
```

---

# 💡 Key Learnings

- Learned how Terraform Providers work.
- Understood Provider Version Pinning.
- Learned the difference between Resources and Data Sources.
- Worked with AWS Infrastructure using Terraform.
- Understood Meta Arguments such as count, for_each, depends_on and lifecycle.
- Learned Terraform State Management.
- Successfully provisioned and destroyed AWS resources.

---

# 📖 Challenges Faced

- Configured AWS CLI authentication.
- Understood AWS Provider setup.
- Faced an EC2 Free Tier eligibility issue because the selected instance type was not supported for my AWS account/region.
- Learned how to review Terraform errors and update the configuration accordingly.

---

# 👨‍💻 Author

**Aditya Nivalkar**

**TerraWeek Challenge - Day 3**

#TrainWithShubham #TerraWeekChallenge #Terraform #AWS #DevOps #InfrastructureAsCode