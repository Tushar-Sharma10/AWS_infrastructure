# Creating the virtual private cloud 
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"
  tags = {
    name        = "Myvpc"
    environment = "Development"
  }
}
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[0]
  tags = {
    name = "public_subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Myvpc internet gateway"
  }
}

# Route table for routing traffic from the VPC to the internet via the internet gateway
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    name = "myvpc_route_table"
  }
}

# Associating the route table with the subnet for routing traffic
resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rt.id
}
