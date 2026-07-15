# 🚀 TerraWeek Challenge - Day 2

## 📅 Date
**Monday, 13th July 2026**

## 📖 Topic
**HCL Deep Dive: Variables, Types & Expressions**

---

# 🎯 Learning Goals

- Understand HCL syntax
- Learn Blocks, Arguments & Expressions
- Work with Variables and Data Types
- Use Variable Validation
- Understand Sensitive Variables
- Learn Locals & Outputs
- Explore Terraform Built-in Functions
- Understand Variable Precedence
- Deploy an Nginx Docker Container using Terraform

---

# 📝 Task 1 – HCL Syntax

## What is HCL?

HashiCorp Configuration Language (HCL) is the language used to write Terraform configuration files. It is simple, human-readable, and declarative.

---

## Anatomy of a Block

```hcl
resource "docker_container" "web" {

  name = "terraweek"

}
```

### Explanation

- **Block Type:** `resource`
- **Label 1:** `docker_container`
- **Label 2:** `web`

---

## Argument

Arguments define configuration inside a block.

Example

```hcl
name = "terraweek"
```

---

## Expression

Terraform expressions allow dynamic values.

### String Interpolation

```hcl
"${local.name_prefix}-${var.container_name}"
```

### Reference

```hcl
var.environment
```

### Operators

```hcl
var.external_port > 1024
```

---

# 📝 Task 2 – Variables, Types & Validation

## Primitive Types

- String
- Number
- Boolean

## Collection Types

- List
- Map
- Set

## Structural Types

- Object
- Tuple

---

## Variable Validation

```hcl
variable "environment" {

  type = string

  default = "dev"

  validation {

    condition = contains(["dev","staging","prod"], var.environment)

    error_message = "Environment must be dev, staging or prod."

  }

}
```

---

## Sensitive Variable

```hcl
variable "password" {

  type = string

  sensitive = true

}
```

Sensitive variables hide confidential information from Terraform output.

---

# 📝 Task 3 – Locals, Outputs & Functions

## Locals

Locals are reusable values computed once and used throughout the configuration.

Example

```hcl
locals {

  name_prefix = "tws-${var.environment}"

}
```

---

## Outputs

Outputs display useful information after Terraform Apply.

Example

```hcl
output "container_name" {

  value = docker_container.web.name

}
```

---

## Built-in Functions Used

### upper()

Converts text to uppercase.

Example

```text
upper("terraweek")

Output

TERRAWEEK
```

---

### merge()

Merges two maps.

Example

```text
merge({a=1},{b=2})
```

---

### join()

Joins list elements.

Example

```text
join("-",["tws","terraweek","2026"])
```

Output

```
tws-terraweek-2026
```

---

### format()

Formats strings.

Example

```hcl
format("http://localhost:%d", var.external_port)
```

---

### length()

Returns collection length.

Example

```text
length(["Terraform","Docker","Git"])
```

Output

```
3
```

---

# 📝 Task 4 – Docker Deployment

Terraform was used to:

- Pull the latest Nginx Docker Image
- Create a Docker Container
- Expose the application on localhost
- Access the application through a web browser
- Destroy the infrastructure

---

## Terraform Workflow

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
terraform output
   ↓
terraform destroy
```

---

# 📂 Files Used

- terraform.tf
- variables.tf
- main.tf
- outputs.tf
- terraform.tfvars

---

# 📷 Screenshots

The following screenshots are available inside the **screenshots/** folder.

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply
- Terraform Console
- Docker Container Running
- Nginx Welcome Page
- Terraform Output
- Terraform Destroy

---

# 📊 Variable Precedence

Highest Priority

```text
-var / -var-file
        ↓
*.auto.tfvars
        ↓
terraform.tfvars
        ↓
TF_VAR Environment Variables
        ↓
Default Values
```

---

# 🍫 Bonus

## For Expression

```hcl
[for name in var.names : upper(name)]
```

---

## Conditional Expression

```hcl
var.environment == "prod" ? "large" : "small"
```

---

# 📚 Key Learnings

- Learned HCL syntax and Terraform configuration structure.
- Understood Blocks, Arguments, and Expressions.
- Worked with Terraform Variables and Data Types.
- Used Validation and Sensitive Variables.
- Learned Locals and Outputs.
- Explored Terraform Built-in Functions.
- Understood Variable Precedence.
- Deployed an Nginx Docker container using Terraform.
- Learned Terraform workflow from initialization to destroy.

---

# 👨‍💻 Author

**Aditya Nivalkar**

**TerraWeek Challenge - Day 2**