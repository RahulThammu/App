# Public subnet with 2 AZs
resource "aws_subnet" "public-subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  count = length(var.az_public)

  # VPC in which subnet will be created
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_range[count.index]


  # The AZs for the public subnet
  availability_zone = var.az_public[count.index]


  # Assigns public ip addresses to instances launched here
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-subnet-${count.index}"
  }
}

# Public subnet with 2 AZs
resource "aws_subnet" "private-subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  count = length(var.az_private)

  # VPC in which subnet will be created
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_range[count.index]


  # The AZs for the public subnet
  availability_zone = var.az_private[count.index]


  tags = {
    Name = "${var.env}-private-subnet-${count.index}"
  }
}


