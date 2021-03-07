# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "staging_vpc" {
  cidr_block = var.cidr_block_vpc

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]} vpc" })
}

#Create subnets
resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.staging_vpc.id
  cidr_block        = var.net_private_cidr_blocks
  availability_zone = var.azs

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]} private subnet" })
}

resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.staging_vpc.id
  cidr_block        = var.net_public_cidr_blocks
  availability_zone = var.azs

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_public" })
}

resource "aws_subnet" "database_subnets" {
  vpc_id            = aws_vpc.staging_vpc.id
  cidr_block        = var.net_database_cidr_blocks
  availability_zone = var.azs

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_database" })
}

resource "aws_subnet" "elasticache_subnets" {
  vpc_id            = aws_vpc.staging_vpc.id
  cidr_block        = var.net_elasticache_cidr_blocks
  availability_zone = var.azs

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_elasticache" })
}

#Create internet gateway for vpc
resource "aws_internet_gateway" "vpc-gw" {
  vpc_id = aws_vpc.staging_vpc.id

 tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_gw" })
}

#Create routes for vpc and subnets
resource "aws_route_table" "route_vpc" {
  vpc_id = aws_vpc.staging_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-gw.id
  }

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_vpc" })
}

resource "aws_route_table" "route_public_subnets" {
  vpc_id = aws_vpc.staging_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-gw.id
  }

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_public_sub" })
}

resource "aws_route_table" "route_private_elasticache_subnets" {
  vpc_id = aws_vpc.staging_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-gw.id
  }

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_sub " })
}

resource "aws_route_table" "route_database_subnets" {
  vpc_id = aws_vpc.staging_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-gw.id
  }

  tags = merge(var.common_tags, { Name = "${var.common_tags["environment"]}_database_sub" })
}

