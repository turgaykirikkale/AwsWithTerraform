variable "ami_name" {
  description = "The AMI nameter"
  type        = string
}
variable "ami_map" {
  description = "AMI's IDs with AMI's Name"
  type        = map(string)
  default = {
    "amazon_linux" = "ami-0c55b159cbfafe1f0"
    "ubuntu"       = "ami-0dba2cb6798deb6d8"
    "windows"      = "ami-0b69ea66ff7391e80"
    "rhel"         = "ami-0cda377a1b884a1bc"
    "centos"       = "ami-052efd3df9dad4825"
    "sles"         = "ami-0dba2cb6798deb6d8"
  }
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "instance_name" {
  description = "Instance Name"
  type        = string
}

