# Associate the routing table to the public subnet
resource "aws_route_table_association" "rt-association-1" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_route_table.public-subnet-rt
  ]

  # Public Subnet ID
  count = length(aws_subnet.public-subnet)

  subnet_id     = aws_subnet.public-subnet[count.index].id

  #  Route Table ID
  route_table_id = aws_route_table.public-subnet-rt.id
}

# Associate the routing table to the private subnet
resource "aws_route_table_association" "rt-association-2" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_route_table.private-subnet-rt
  ]

  # Private Subnet ID
  count = length(aws_subnet.public-subnet)

  subnet_id     = aws_subnet.private-subnet[count.index].id

  #  Route Table ID
  route_table_id = aws_route_table.private-subnet-rt.id
}