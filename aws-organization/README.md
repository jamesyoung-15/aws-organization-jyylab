# Usage

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
