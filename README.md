# AWS Organization Terraform

My AWS Organization deployment with Terraform. SSO setup and permission sets done manually for now.

## Plan

![AWS Organization Diagram](./diagrams/aws-organization-draft.png)

- Admin: Manages organization
  - Workload: Application and data environments
    - Dev: Write/test code
    - Testing: Testing/staging dev changes before production
    - Production: Released application + data
  - Infrastructure: Shared infrastructure services (backups, network (eg. Route 53), monitoring, etc.)
  - Security: Logs (CloudTrail, VPC flow logs), security tooling
  - Sandbox: Experiment/test AWS services, learning, etc.
  - Deployments: CI/CD services

Reference:

- [AWS Organizations Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/recommended-ous-and-accounts.html)
- [Managing Your Game Studio on AWS](https://aws.amazon.com/blogs/gametech/managing-your-game-studio-on-aws-part-1/)
