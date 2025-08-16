# ---------- Provider ----------
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# ---------- Data: Latest Amazon Linux 2 AMI ----------
data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ---------- S3 Bucket ----------
resource "aws_s3_bucket" "bucket" {
  bucket = "zamshed-s3"  # Fixed name, must be globally unique
  tags = merge(var.default_tags, {
    Name = "Zamshed-S3"
  })
}

# ---------- EC2 Instance ----------
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = var.instance_type

  tags = merge(var.default_tags, {
    Name = "Zamshed-EC2"
  })
}

# ---------- Outputs ----------
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.bucket.bucket
}
