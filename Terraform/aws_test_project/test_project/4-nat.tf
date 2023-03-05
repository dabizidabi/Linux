resource "aws_eip" "nat" {
  count = 2
  vpc   = true

  tags = {
    Name = "nat ${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat" {
  count         = 2
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.private-subnets[count.index].id

  tags = {
    Name = "gw NAT ${count.index + 1}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
