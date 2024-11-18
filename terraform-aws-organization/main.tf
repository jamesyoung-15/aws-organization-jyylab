provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_organization" "my_organization" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com",
    "backup.amazonaws.com",
    "storage-lens.s3.amazonaws.com"
  ]
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.my_organization.roots[0].id # Root of the organization
}