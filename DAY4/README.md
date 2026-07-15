# 🚀 TerraWeek Challenge - Day 4

## 📅 Date
**Wednesday, 15th July 2026**

## 📖 Topic
**Terraform State & Remote Backends (Native Locking)**

---

# 🎯 Learning Goals

- Understand Terraform State
- Learn why State is important
- Explore Terraform State Commands
- Configure Remote Backend using Amazon S3
- Enable Native State Locking using `use_lockfile`
- Import Existing Resources into Terraform
- Secure Terraform State

---

# 📝 Task 1 – Understanding Terraform State

## What is terraform.tfstate?

The **terraform.tfstate** file is Terraform's state file. It stores information about all the infrastructure resources created and managed by Terraform.

Terraform compares the configuration files with the state file to determine what changes need to be applied.

---

## Why should we never edit terraform.tfstate manually?

- It may corrupt the infrastructure state.
- Terraform may lose track of resources.
- Infrastructure can become inconsistent.
- Always use Terraform commands instead of editing the file manually.

---

## Why should terraform.tfstate never be committed to Git?

The state file may contain:

- AWS Resource IDs
- IP Addresses
- Bucket Names
- Database Information
- Secrets and Sensitive Data

Therefore it should always be excluded using **.gitignore**.

Example:

```gitignore
*.tfstate
*.tfstate.*
.terraform/
```

---

## What is State Drift?

State Drift occurs when infrastructure is modified outside Terraform (for example, directly from the AWS Console).

Terraform detects these differences during:

```bash
terraform plan
```

or

```bash
terraform refresh
```

---

## Why is Terraform State Sensitive?

The state file can contain sensitive information such as:

- Passwords
- Resource IDs
- Access Information
- Secrets
- Infrastructure Details

Therefore it should be securely stored.

---

# 📝 Task 2 – Terraform State Commands

## terraform state list

Lists all resources managed by Terraform.

```bash
terraform state list
```

---

## terraform state show

Displays detailed information about a resource.

```bash
terraform state show random_pet.demo
```

---

## terraform state mv

Moves or renames a resource inside the state without recreating it.

```bash
terraform state mv source destination
```

---

## terraform state rm

Removes a resource from Terraform State without deleting the actual infrastructure.

```bash
terraform state rm resource_name
```

---

## terraform show

Displays the complete Terraform State in a human-readable format.

```bash
terraform show
```

---

# 📝 Task 3 – Backend Infrastructure

Created an Amazon S3 Bucket to store Terraform State remotely.

Features enabled:

- Versioning
- Server Side Encryption
- Public Access Block
- Secure Remote Backend

---

## Terraform Workflow

```text
backend_infra

terraform init
      ↓
terraform apply
      ↓
S3 Bucket Created
```

---

# 📝 Task 4 – Remote Backend Configuration

Configured Terraform Remote Backend using Amazon S3.

Example:

```hcl
terraform {

  backend "s3" {

    bucket = "your-state-bucket"

    key = "day04/backend_demo/terraform.tfstate"

    region = "us-east-1"

    encrypt = true

    use_lockfile = true

  }

}
```

---

## What is Native Locking?

Terraform 1.11 introduced **Native S3 State Locking** using

```hcl
use_lockfile = true
```

No DynamoDB table is required anymore.

---

## Benefits

- Prevents multiple users from modifying the same state simultaneously.
- Protects infrastructure from corruption.
- Simplifies backend configuration.
- Faster than DynamoDB locking.

---

# 📝 Task 5 – Import Existing Resources

Terraform supports importing existing cloud resources.

Example:

```hcl
import {

  to = aws_s3_bucket.imported

  id = "my-existing-bucket"

}
```

Generate Terraform Configuration

```bash
terraform plan -generate-config-out=generated.tf
```

---

# ☁️ AWS Services Used

- Amazon S3
- Terraform Backend
- Terraform State
- Native State Locking

---

# 📂 Files Used

## backend_infra

- terraform.tf
- resources.tf
- variables.tf
- outputs.tf

## backend_demo

- terraform.tf
- resources.tf

---

# 📷 Screenshots

The following screenshots are available inside the **screenshots/** folder.

- Terraform Init
- Terraform Apply
- Terraform State List
- Terraform State Show
- Terraform Show
- Terraform Output
- S3 Bucket Created
- Terraform State File in S3
- Lock File (.tflock)
- Terraform Destroy

---

# 📚 Commands Used

```bash
terraform init

terraform apply

terraform state list

terraform state show random_pet.demo

terraform show

terraform output

terraform destroy
```

---

# 🔐 Why Remote Backend?

Advantages of Remote Backend

- Centralized Terraform State
- Team Collaboration
- Secure Storage
- Version History
- State Locking
- Disaster Recovery

---

# 💡 Key Learnings

- Learned Terraform State concepts.
- Understood the importance of state management.
- Explored Terraform State commands.
- Configured Amazon S3 as a Remote Backend.
- Enabled Native State Locking using `use_lockfile`.
- Learned how to securely store Terraform State.
- Understood how to import existing infrastructure into Terraform.
- Learned why `.tfstate` files should never be committed to GitHub.

---

# ⚠️ Best Practices

- Never commit `.tfstate` files.
- Always use Remote Backends.
- Enable Bucket Versioning.
- Enable Encryption.
- Use Native State Locking.
- Protect Sensitive Information.

---

# 👨‍💻 Author

**Aditya Nivalkar**

**TerraWeek Challenge - Day 4**

#TrainWithShubham #TerraWeekChallenge #Terraform #AWS #S3 #DevOps #InfrastructureAsCode #RemoteBackend