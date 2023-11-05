#Create NAT gateway and attach the elastic IP address
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet[0].id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "${var.env}-nat-gw"
  }
}