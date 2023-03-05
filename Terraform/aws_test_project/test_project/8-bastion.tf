resource "aws_security_group" "allow-ex-ssh" {
  name = "allow-ex-sh"
}

resource "aws_vpc_security_group_ingress_rule" "allow-ex-ssh" {
  security_group_id = aws_security_group.allow-ex-ssh.id

  ip_protocol = "tcp"
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnets[0].id
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.allow-ex-ssh.id
  ]

  tags = {
    Name = "bastion"
  }
}


######################## Keys for ssh ############################
# Security Notice
#
# The private key generated by this resource will be stored unencrypted in your Terraform state file. Use of this resource for production deployments is not 
# recommended. Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
####################################################################

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
