output "organization_id" {
  value = "Created organization ${aws_organizations_organization.my_organization.id}"
}

output "organization_units" {
  value = "Created organizational unit ${aws_organizations_organizational_unit.sandbox.id}"
}