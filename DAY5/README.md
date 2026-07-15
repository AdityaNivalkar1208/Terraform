# 🚀 TerraWeek Challenge - Day 5

## 📅 Date
**Thursday, 16th July 2026**

## 📖 Topic
**Terraform Modules - Reusable & Composable Infrastructure**

---

# 🎯 Learning Goals

- Understand Terraform Modules
- Learn Root Module and Child Modules
- Create a Reusable Local Module
- Consume Modules from Terraform Registry
- Understand Module Versioning
- Use `for_each` with Modules

---

# 📝 Task 1 – Understanding Terraform Modules

## What is a Module?

A Terraform module is a collection of Terraform configuration files that are grouped together to perform a specific task. Modules help in organizing, reusing, and maintaining infrastructure code.

---

## What is the Root Module?

The Root Module is the main Terraform configuration from where Terraform commands like `terraform init`, `terraform plan`, and `terraform apply` are executed.

---

## Benefits of Modules

- Code Reusability
- Consistent Infrastructure
- Easy Maintenance
- Better Project Organization
- Encapsulation
- Version Control
- Easier Testing
- Scalable Infrastructure

---

## Standard Module Structure

```
module-name/
│
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

# 📝 Task 2 – Local Reusable Module

Created a reusable EC2 Instance Module.

## Module Path

```
modules/
└── ec2_instance/
```

The module accepts the following inputs:

- AMI ID
- Instance Type
- Environment
- Subnet ID
- Security Group IDs
- Tags

Outputs:

- Instance ID
- Public IP
- Private IP

---

# Root Module

The Root Module resolves shared resources such as:

- Latest Amazon Linux AMI
- Default VPC
- Default Subnet
- Default Security Group

These values are passed to the child module as inputs.

Example:

```hcl
module "web_server" {
  source                 = "./modules/ec2_instance"
  name                   = "web"
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
}
```

---

# 📝 Task 3 – Module Composition using for_each

The same module can be instantiated multiple times using `for_each`.

Example:

```hcl
module "servers" {
  source   = "./modules/ec2_instance"
  for_each = toset(["app", "worker", "cache"])

  name                   = each.key
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
}
```

Advantages:

- Cleaner Code
- Easy Scaling
- Reusable Infrastructure
- Less Duplication

---

# 📝 Task 4 – Registry Modules

Terraform also provides official modules through the Terraform Registry.

Example:

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "terraweek-vpc"
  cidr = "10.0.0.0/16"
}
```

---

# Why Version Pinning?

Version pinning ensures:

- Stable Infrastructure
- Reproducible Builds
- Avoids Breaking Changes
- Safe Upgrades

---

# 📝 Task 5 – Module Version Locking

## Registry Module

```hcl
version = "~> 5.0"
```

---

## Exact Version

```hcl
version = "= 5.1.2"
```

---

## Version Range

```hcl
version = ">= 5.0, < 6.0"
```

---

## Git Repository

```hcl
source = "git::https://github.com/org/repo.git//module?ref=v1.2.0"
```

---

## Git Commit SHA

```hcl
source = "git::https://github.com/org/repo.git//module?ref=<commit-sha>"
```

Using commit SHA ensures immutable infrastructure deployments.

---

# 📂 Project Structure

```
DAY5/
│
├── README.md
├── example/
│   ├── terraform.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── modules/
│       └── ec2_instance/
│           ├── README.md
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
│
└── screenshots/
```

---

# ☁️ AWS Resources Used

- EC2 Instance
- Amazon Linux 2023 AMI
- Default VPC
- Default Security Group
- Default Subnet

---

# 📚 Terraform Commands Used

```bash
terraform init

terraform validate

terraform fmt

terraform plan

terraform apply

terraform output

terraform destroy
```

---

# 📷 Screenshots

The following screenshots are included in the **screenshots/** folder.

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply
- Terraform Output
- AWS EC2 Instance
- Terraform Destroy

---

# 💡 Key Learnings

- Learned Terraform Modules.
- Understood Root Module and Child Module.
- Created a reusable EC2 Module.
- Passed variables from Root Module to Child Module.
- Used Module Outputs.
- Understood `for_each` with Modules.
- Learned Module Versioning.
- Explored Terraform Registry Modules.
- Learned Infrastructure Reusability.

---

# ✅ Best Practices

- Keep modules reusable.
- Pass values as input variables.
- Expose only required outputs.
- Always pin module versions.
- Add validation for module inputs.
- Maintain a README for every reusable module.

---

# 👨‍💻 Author

**Aditya Nivalkar**

**TerraWeek Challenge - Day 5**

---

# 🔖 Tags

#TrainWithShubham #TerraWeekChallenge #Terraform #AWS #DevOps #InfrastructureAsCode #Modules #CloudComputing