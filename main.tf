
module "ec2-instance" {
  source                 = "https://github.com/Nani-roy/terraform_test.git ?ref=v1.1.1"
  subnet_id              = aws_subnet.my_subnet.id
  key_name               = "user1"
  vpc_security_group_ids = [aws_security_group.main.name]

  version = "5.5.0"
}
output "vm-public-ip" {
  value = aws_instance.example
}
