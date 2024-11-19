# Usage

## Accounts Setup

Edit `variables.tf` to change account name, email domain, account email.

## Backend Config Example

Add remote backend eg. `backend.tf`:

``` conf
backend "remote" {
    hostname = "app.terraform.io"
    organization = "jyylab"
    workspaces {
        name = "aws-organization-jyylab-dev"
    }
}
```
