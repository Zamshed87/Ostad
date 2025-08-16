# Assignment-5: Terraform Project (EC2 + S3)

This project provisions an **EC2 instance** and an **S3 bucket** in AWS using Terraform.

---

## 📁 Project Structure

```
Assignment-5/
└── terraform-modules/
    ├── main.tf              # Main Terraform configuration
    ├── variables.tf         # Input variables
    ├── outputs.tf           # Outputs for EC2 & S3
    ├── terraform.tfvars     # Variables file (contains region, instance_type, etc.)
    ├── README.md            # Documentation
    └── .gitignore           # Ignore secrets & Terraform cache
```

---

## 🔑 AWS Credentials

⚠️ **Do NOT hardcode AWS access keys in GitHub repo.**
Instead, use environment variables or AWS CLI credentials.

Example:
```bash
aws configure
```
This will store keys securely in `~/.aws/credentials`.

---

## ⚙️ Terraform Commands

### 1️⃣ Initialize Terraform
```bash
terraform init
```

If you update provider or module versions:
```bash
terraform init --upgrade
```

### 2️⃣ Validate Terraform Configuration
```bash
terraform validate
```

### 3️⃣ Execution Plan (Preview changes)
If using `variables.tfvars` file, rename it:
```bash
mv variables.tfvars terraform.tfvars
```
Then run:
```bash
terraform plan
```

Alternatively, specify the file:
```bash
terraform plan -var-file="variables.tfvars"
```

### 4️⃣ Apply (Create Infrastructure)
```bash
terraform apply --auto-approve
```

### 5️⃣ Destroy (Delete Infrastructure)
```bash
terraform destroy --auto-approve
```

---

## 📦 .gitignore (Important!)

To avoid pushing secrets and large Terraform cache files to GitHub, use:

```
terraform.tfvars
*.tfstate
*.tfstate.backup
.terraform/
```

---


---

## ✅ Notes

- Use **IAM users & roles** instead of embedding access keys.  
- GitHub Push Protection will block secrets — ensure no AWS keys are pushed.  
- This setup deploys:
  - 1 × **EC2 Instance** named `Zamshed-EC2`
  - 1 × **S3 Bucket** named `zamshed-s3`  

---

👨‍💻 **Author:** Zamshed Iqbal  
📅 Assignment-5 (Terraform + AWS)
