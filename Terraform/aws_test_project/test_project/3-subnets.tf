locals {
  availability_zones  = ["eu-west-1a", "eu-west-1b"]
  private_cidr_blocks = ["10.0.10.0/24", "10.0.11.0/24"]
  public_cidr_blocks  = ["10.0.12.0/24", "10.0.13.0/24"]
  private_subnet_tag  = "private"
  public_subnet_tag   = "public"
}

resource "aws_subnet" "private-subnets" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_cidr_blocks[count.index]
  availability_zone = local.availability_zones[count.index]

  tags = {
    "Name" = "${local.private_subnet_tag}-${local.availability_zones[count.index]}"
  }
}


resource "aws_subnet" "public-subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_cidr_blocks[count.index]
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${local.public_subnet_tag}-${local.availability_zones[count.index]}"
  }
}
