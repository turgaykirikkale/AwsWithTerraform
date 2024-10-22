resource "aws_instance" "instance" {
  ami           = lookup(var.ami_map, var.ami_name)  # AMI adı ile AMI ID'sini bul
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name  # Her instance'a isim atanır
  }
}
