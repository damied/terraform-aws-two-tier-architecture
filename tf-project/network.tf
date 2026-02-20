resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "server-vpc"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "web-server"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "database-server"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "server-igw"
  }
}
resource "aws_eip" "natgw_eip" {
  domain = "vpc"

  tags = {
    Name = "server-natgw-eip"
  }
}
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw_eip.allocation_id
  subnet_id     = aws_subnet.Public_subnet.id

  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "server-natgw"
  }

}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route.id
}