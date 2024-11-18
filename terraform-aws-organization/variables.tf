variable "aws_region" {
  description = "Set AWS region."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name eg. dev, prod, test"
  type        = string
}