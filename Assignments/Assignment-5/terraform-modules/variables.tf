variable "region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "default_tags" {
  description = "Common resource tags"
  type        = map(string)
  default = {
    Project   = "ZamshedS3"
    ManagedBy = "Terraform"
  }
}

variable "access_key" {
  description = "AWS Access Key ID"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Access Key"
  type        = string
}
