provider "aws" {
  region = "us-east-1"
  //Aws secret and access keys
}

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}


//LOCAL FORS CREATING FOR MORE THAN ONE INSTANCES
locals {
  instances = {
    "Instance1" = {
      ami_name      = "ubuntu"
      instance_type = "t3.micro" # For Ubuntu
    }
    "Instance2" = {
      ami_name      = "centos"
      instance_type = "t2.micro" # For Linux
    }
    "Instance3" = {
      ami_name      = "windows"
      instance_type = "t3.micro" # For Windows
    }
  }
}

//Single Instnce Created,
module "public_instance" {
  source        = "./modules/ec2"
  ami_name      = "ubuntu"
  instance_type = "t3.micro"
  instance_name = "Public Instance"
}

//Creating Multiple Instances

module "multiple_instaces" {
  for_each      = local.instances
  source        = "./modules/ec2"
  ami_name      = each.value.ami_name
  instance_type = each.value.instance_type
  instance_name = each.key
}

//Single instance Ip
output "instance_IP" {
  value = module.public_instance.instance_IP
}

//Multiple Instance IPs from locals.
output "instance_public_ips" {
  value = [for instance in module.multiple_instaces : instance.instance_IP]
}
