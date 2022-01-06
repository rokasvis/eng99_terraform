# Let Terraform know who is our cloud provider


# AWS plugins/dependencies will be downloaded


provider "aws" {
    region = "eu-west-1"
    # This will allow teraform to create services on eu-west-1
}