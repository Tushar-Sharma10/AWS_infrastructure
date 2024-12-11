# Using the data source to grab the latest ami of the ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

# Data source for availability zone
data "aws_availability_zones" "az" {}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instancetype
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.mysg_1.id]
  user_data              = base64encode(file("userdata.sh"))
}
