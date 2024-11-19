provider "aws" {
  region = var.aws_region
}

resource "aws_organizations_organization" "my_organization" {
  # aws service principal names: https://gist.github.com/shortjared/4c1e3fe52bdfa47522cfe5b41e5d6f22
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com",
    "backup.amazonaws.com",
    "storage-lens.s3.amazonaws.com",
    "account.amazonaws.com",
    "ram.amazonaws.com",
    "compute-optimizer.amazonaws.com",
    "servicequotas.amazonaws.com",
    "ssm.amazonaws.com",
    "tagpolicies.tag.amazonaws.com",
    "securitylake.amazonaws.com",
  ]
  feature_set = "ALL"
  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY",
    "BACKUP_POLICY",
    # "RESOURCE_CONTROL_POLICY",
  ]
}

### Organizational Units ###

# Sandbox OU
resource "aws_organizations_organizational_unit" "sandbox_ou" {
  name      = "Sandbox"
  parent_id = local.root_organization_id
}

# Workload OU: Dev, Test, Prod
resource "aws_organizations_organizational_unit" "workload_ou" {
  name      = "Workload"
  parent_id = local.root_organization_id
}

resource "aws_organizations_organizational_unit" "dev_ou" {
  name      = "Dev"
  parent_id = local.workload_ou_id
}

resource "aws_organizations_organizational_unit" "test_ou" {
  name      = "Test"
  parent_id = local.workload_ou_id
}

resource "aws_organizations_organizational_unit" "prod_ou" {
  name      = "Prod"
  parent_id = local.workload_ou_id
}

# Infrastructure OU
resource "aws_organizations_organizational_unit" "infrastructure_ou" {
  name      = "Infrastructure"
  parent_id = local.root_organization_id
}

# Security OU
resource "aws_organizations_organizational_unit" "security_ou" {
  name      = "Security"
  parent_id = local.root_organization_id
}

# Deployment OU
resource "aws_organizations_organizational_unit" "deployment_ou" {
  name      = "Deployment"
  parent_id = local.root_organization_id
}

# Suspended OU
resource "aws_organizations_organizational_unit" "suspended_ou" {
  name      = "Suspended"
  parent_id = local.root_organization_id
}

### Organization Accounts ###

# Sandbox Accounts
resource "aws_organizations_account" "sandbox_accounts" {
  for_each = var.sandbox_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.sandbox_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

# Workload Accounts
resource "aws_organizations_account" "dev_accounts" {
  for_each = var.dev_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.dev_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

resource "aws_organizations_account" "test_accounts" {
  for_each = var.test_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.test_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

resource "aws_organizations_account" "prod_accounts" {
  for_each = var.prod_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.prod_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

# Infrastructure Accounts
resource "aws_organizations_account" "infrastructure_accounts" {
  for_each = var.infrastructure_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.infrastructure_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

# Security Accounts
resource "aws_organizations_account" "security_accounts" {
  for_each = var.security_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.security_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}

# Deployment Accounts
resource "aws_organizations_account" "deployment_accounts" {
  for_each = var.deployment_accounts
  name     = each.value["name"]
  email    = "${each.value["email_name"]}@${var.email_domain}"
  parent_id = aws_organizations_organizational_unit.deployment_ou.id
  close_on_deletion = each.value["close_on_deletion"]
}
