data "aws_availability_zones" "available" {}


resource "aws_vpc" "this" {
  cidr_block = var.cidr
  tags = { Name = "${var.name}-vpc" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id
}

# Create subnets (two AZs)
resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.this.id
  cidr_block = element(var.public_subnets_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = { Name = "${var.name}-public-${count.index}" }
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.this.id
  cidr_block = element(var.private_subnets_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = { Name = "${var.name}-private-${count.index}" }
}

