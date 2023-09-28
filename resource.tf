resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}



resource "aws_subnet" "my_subnet" {
  vpc_id            = data.aws_vpc.main.id
  cidr_block        = "172.16.32.0/20"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-example"
  }
}
resource "aws_security_group" "main" {
  name   = "vpc-file"
  vpc_id = data.aws_vpc.main.id
  dynamic "ingress" {
    for_each = local.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr
    }
  }
}
