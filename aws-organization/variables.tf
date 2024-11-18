variable "aws_region" {
  description = "Set AWS region."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name eg. dev, prod, test"
  type        = string
}

variable "email_domain" {
  description = "Email domain for accounts"
  type        = string
}

# Define the accounts for the organization

variable "sandbox_accounts" {
  description = "Sandbox accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "sandbox1" = {
      name              = "sandbox-jyy"
      email_name        = "jyylabaws1-sandbox"
      close_on_deletion = false
    }
  }
}

variable "dev_accounts" {
  description = "Dev accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "dev1" = {
      name              = "dev-jyy"
      email_name        = "dev"
      close_on_deletion = false
    }
  } 
}

variable "test_accounts" {
  description = "Test accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "test1" = {
      name              = "test-jyy"
      email_name        = "jyylabaws1-test"
      close_on_deletion = false
    }
  }
}

variable "prod_accounts" {
  description = "Prod accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "prod1" = {
      name              = "prod-jyy"
      email_name        = "jyylabaws1-prod"
      close_on_deletion = false
    }
  }
}

variable "infrastructure_accounts" {
  description = "Infrastructure accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "infrastructure1" = {
      name              = "shared-infra-jyy"
      email_name        = "jyylabaws1-shared-infra"
      close_on_deletion = false
    }
    "infrastructure2" = {
      name              = "network-jyy"
      email_name        = "jyylabaws1-infra-network"
      close_on_deletion = false
    }
    "infrastructure3" = {
      name              = "backup-jyy"
      email_name        = "jyylabaws1-infra-backup"
      close_on_deletion = false
    }
  }
}

variable "security_accounts" {
  description = "Security accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "security1" = {
      name              = "security-tooling-jyy"
      email_name        = "jyylabaws1-security-tooling"
      close_on_deletion = false
    }
    "security2" = {
      name              = "log-archive-jyy"
      email_name        = "jyylabaws1-log-archive"
      close_on_deletion = false
    }
  }
}

variable "deployment_accounts" {
  description = "Deployment accounts"
  type        = map(object({
    name               = string
    email_name         = string
    close_on_deletion  = bool
  }))
  default = {
    "deployment1" = {
      name              = "deployment-jyy"
      email_name        = "jyylabaws1-deployment"
      close_on_deletion = false
    }
  }
}