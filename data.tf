data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}
data "aws_vpc" "main" {
  default = true
}
locals {
  inbound_rules = [
    {
      port     = 22
      protocol = "tcp"
      cidr     = ["192.168.1.0/24"]

    },
    {
      port     = 80
      protocol = "tcp"
      cidr     = ["0.0.0.0/0"]

    }
  ]
}