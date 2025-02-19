variable "bucket_name" {
  description = "Base name of the S3 bucket"
  type        = string
}

variable "env" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
}