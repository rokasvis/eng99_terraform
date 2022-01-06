# Let Terraform know who is our cloud provider


# AWS plugins/dependencies will be downloaded


provider "aws" {
    region = "eu-west-1"
    # This will allow teraform to create services on eu-west-1
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eng99_rokas_VPC1"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a"]
  private_subnets = ["10.0.8.0/24"]
  public_subnets  = ["10.0.9.0/24"]



  tags = {
    Name = "eng99_rokas_VPC1"
  }
}
# Start with launching an ec2 instance using terraform script
resource "aws_instance" "app_instance" {
    ami = var.app_ami_id
    instance_type = "t2.micro"
    associate_public_ip_address = true
    
    tags = {
        Name = var.name
    }  
    key_name = var.aws_key_name
}
# To initialise we use terrafor init
# terraform plan
# terraform apply
# terraform destroy

resource "aws_vpc" "eng99_rokas" {
  
}