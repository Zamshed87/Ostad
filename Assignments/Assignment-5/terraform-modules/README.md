# Terraform Assignment: EC2 + S3

This repo contains minimal Terraform to provision **one EC2 t2.micro** and **one S3 bucket** in **us-east-1**, then destroy them.

## Files
- `main.tf`, `variables.tf`, `outputs.tf`
- Random hex suffix ensures S3 bucket name is globally unique.
- Tags added on both resources (bonus).

## Prereqs
- AWS credentials configured (e.g., `aws configure` or environment variables).
- Terraform >= 1.3.0

## Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
# verify in AWS Console
terraform destroy -auto-approve
```

## What to Capture for Submission (Put in the PDF)
1. **EC2 screenshot** (AWS Console → EC2 → Instances)
2. **S3 bucket screenshot** (AWS Console → S3 → Buckets)
3. **Terminal screenshot** showing `terraform apply` success (with outputs)
4. **Terminal screenshot** showing `terraform destroy` success
5. **Code snippets** of `main.tf`, `variables.tf`, `outputs.tf` (you can paste from this project)

---
_Generated on 2025-08-16_
