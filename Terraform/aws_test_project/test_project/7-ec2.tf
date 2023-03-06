locals {
  # Allow traffic from alb and connect from bastion host
  ec2-sg = {
    to_port                      = [22, 80]
    referenced_security_group_id = [aws_security_group.allow-ex-ssh.id, aws_security_group.allow-http.id]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-jammy-22.04-amd64*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "allow-internal-ssh-http" {
  name = "allow-internal-ssh-http"
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  count                        = 2
  security_group_id            = aws_security_group.allow-internal-ssh-http.id
  ip_protocol                  = "tcp"
  to_port                      = local.ec2-sg.to_port[count.index]
  referenced_security_group_id = local.ec2-sg.referenced_security_group_id[count.index]
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private-subnets[0].id
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.allow-internal-ssh-http.id
  ]

  tags = {
    Name = "HelloWorld"
  }
}
