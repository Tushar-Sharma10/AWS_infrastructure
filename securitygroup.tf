# Security group and rules for the VPC 
resource "aws_security_group" "mysg_1" {
  name_prefix = "web_security_group"
  vpc_id      = aws_vpc.myvpc.id
  tags = {
    Name = "web_security"
  }
}

# ALl of these inbound and outbound rules are just for the IPV4 not for the IPV6
# Inbound rule for HTTP
resource "aws_vpc_security_group_ingress_rule" "http-rule" {
  security_group_id = aws_security_group.mysg_1.id
  description       = "HTTP"
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Inbound rule for SSH
resource "aws_vpc_security_group_ingress_rule" "ssh-rule" {
  security_group_id = aws_security_group.mysg_1.id
  description       = "SSH"
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Outbound rule for all traffic
resource "aws_vpc_security_group_egress_rule" "outbound-rule" {
  security_group_id = aws_security_group.mysg_1.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = "-1"
}


