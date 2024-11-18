# Usage

## Variable Config

Create variable file eg. `example.tfvars` and run `terraform apply -var-file=env/example.tfvars`. 

`example.tfvars`:

``` conf
email_domain = "jyymail.com"
environment = "dev"
sandbox_accounts = {
    "sandbox1" = {
      name              = "jyylabaws-sandbox1"
      email_name        = "jyylabaws-sandbox1-test1"
      close_on_deletion = false
    }
}
```

## Backend Config Example

To use remote backend, either create a file with backend config and can specify with something like `terraform init -backend-config=backend_config.hcl`.

``` conf
backend "remote" {
    hostname = "app.terraform.io"
    organization = "jyylab"
    workspaces {
        name = "aws-organization-jyylab-dev"
    }
}
```
