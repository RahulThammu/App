# Launch a bastion-host in the public subnet, in order to access the EC2 instances in private subnet
resource "aws_instance" "bastion_host" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_key_pair.mykeypair,
    aws_security_group.sg-bastion
  ]

  # AMI ID - Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  ami           = var.ami
  
  instance_type = var.instance_type

  count = length(aws_subnet.public-subnet)

  subnet_id     = aws_subnet.public-subnet[0].id

  key_name = "tf-deploy"

  # Security groups to use
  vpc_security_group_ids = [aws_security_group.sg-bastion.id ]


  tags = {
    Name = "{var.env}-bastion-host"
  }
}


# Create a Security Group for bastion host to allow ssh on port 22
resource "aws_security_group" "sg-bastion" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
  ]

  # Name of the bastion security group
  name        = "${var.env}-bastion-sg"
  description = "Allow bastion host to ssh and to allow traffic from alb"

  # VPC ID in which Security group has to be created
  vpc_id = aws_vpc.vpc.id

  # Create an inbound rule for SSH access
  ingress {
    description = "SSH from outside"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # Outward Network Traffic from the server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-bastion-host-sg"
  }
}
