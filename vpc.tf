#  VPC
resource "aws_vpc" "vpc" {

  # CIDR block
  cidr_block = var.cidr_block

  # DNS support
  enable_dns_support = true

  tags = {
    Name = "${var.env}-vpc"
  }
}