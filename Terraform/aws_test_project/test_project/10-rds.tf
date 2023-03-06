resource "aws_security_group" "allow-db-access" {
  name = "allow-db-access"
}

resource "aws_vpc_security_group_ingress_rule" "allow-db-access" {
  security_group_id = aws_security_group.allow-db-access.id

  cidr_ipv4   = "10.0.0.0/16"
  ip_protocol = "tcp"
  to_port     = 5432
}

resource "aws_db_subnet_group" "postgres" {
  name       = "postgres-subnet-group"
  subnet_ids = [aws_subnet.private-subnets[0].id, aws_subnet.private-subnets[1].id] #ids from 3-subnets.tf
}

resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "14.7"
  instance_class         = "db.t2.micro"
  allocated_storage      = 10
  storage_type           = "gp2"
  username               = "foo"
  password               = "foobarbaz"
  db_name                = "test"
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [aws_security_group.allow-db-access.id]

  tags = {
    Name = "my-postgres-db"
  }
}
