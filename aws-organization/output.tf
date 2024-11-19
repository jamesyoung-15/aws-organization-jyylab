output "organization_id" {
  value = "Created organization ${aws_organizations_organization.my_organization.id}"
}

output "ou_ids" {
  value = {
    workload_ou_id = "Created workload OU ${aws_organizations_organizational_unit.workload_ou.id}"
    dev_ou_id      = "Created dev OU ${aws_organizations_organizational_unit.dev_ou.id} under workload OU"
    test_ou_id     = "Created test OU ${aws_organizations_organizational_unit.test_ou.id} under workload OU"
    prod_ou_id     = "Created prod OU ${aws_organizations_organizational_unit.prod_ou.id} under workload OU"
    sandbox_ou_id  = "Created sandbox OU ${aws_organizations_organizational_unit.sandbox_ou.id}"
    infrastructure_ou_id = "Created infrastructure OU ${aws_organizations_organizational_unit.infrastructure_ou.id}"
    deployment_ou_id = "Created deployment OU ${aws_organizations_organizational_unit.deployment_ou.id}"
    suspended_ou_id = "Created suspended OU ${aws_organizations_organizational_unit.suspended_ou.id}"
    security_ou_id = "Created security OU ${aws_organizations_organizational_unit.security_ou.id}"
  }
}