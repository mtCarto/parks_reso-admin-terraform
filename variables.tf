# variables.tf

variable "target_env" {
  description = "AWS workload account env (e.g. dev, test, prod, sandbox, unclass)"
}

variable "target_aws_account_id" {
  description = "AWS workload account id"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ca-central-1"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "parks_reso-admin"
}

variable "domain_name" {
  description = "Domain name for CloudFront distribution"
  type        = string
  default     = "dev.parks-reso-admin.com"
}

variable "s3_bucket" {
  description = "S3 Bucket containing static web files for CloudFront distribution"
  type        = string
  default     = "parks_reso_admin
}

variable "s3_bucket_name" {
  description = "Human readable S3 bucket name for labels"
  type        = string
  default     = "BC Parks Day Pass Admin"
}

variable "s3_origin" {
  description = "S3 Origin Id"
  type        = string
  default     = parks-admin-s3-origin
}

variable "budget_amount" {
  description = "The amount of spend for the budget. Example: enter 100 to represent $100"
  default     = "100.0"
}

variable "budget_tag" {
  description = "The Cost Allocation Tag that will be used to build the monthly budget. "
  default     = "Project=BC Parks Day Pass System"
}

variable "common_tags" {
  description = "Common tags for created resources"
  default = {
    Application = "BC Parks Day Pass Admin"
  }
}

variable "service_names" {
  description = "List of service names to use as subdomains"
  default     = ["parks-reso-admin"]
  type        = list(string)
}

variable "log_bucket" {
  description = "S3 bucket to store logs"
  type        = string
  default     = "mylogs.s3.amazonaws.com"
}