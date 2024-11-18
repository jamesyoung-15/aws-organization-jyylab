output "organization_id" {
  value = "Created organization ${aws_organizations_organization.my_organization.id}"
}

output "accounts" {
  value = "Created accounts ${jsonencode(aws_organizations_organization.my_organization.accounts)}"
}