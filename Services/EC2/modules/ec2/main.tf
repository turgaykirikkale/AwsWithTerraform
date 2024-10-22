resource "aws_instance" "instance" {
  ami           = lookup(var.ami_map, var.ami_name)  #Find AMI with AMIs Name
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name 
  }
}
