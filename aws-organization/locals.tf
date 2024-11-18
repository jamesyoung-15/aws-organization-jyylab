locals {
  root_organization_id = aws_organizations_organization.my_organization.roots[0].id # Root of the organization
  workload_ou_id       = aws_organizations_organizational_unit.workload_ou.id
  test_ou_id           = aws_organizations_organizational_unit.test_ou.id
  prod_ou_id           = aws_organizations_organizational_unit.prod_ou.id
  dev_ou_id            = aws_organizations_organizational_unit.dev_ou.id
  infrastructure_ou_id = aws_organizations_organizational_unit.infrastructure_ou.id
  security_ou_id       = aws_organizations_organizational_unit.security_ou.id
  deployment_ou_id     = aws_organizations_organizational_unit.deployment_ou.id
}