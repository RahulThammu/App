
# Create a Security Group for ec2 instances in private subnet to access traffic from alb and bastion-host
resource "aws_security_group" "sg-ec2" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
  ]

  # Name of the webserver security group
  name        = "${var.env}-ec2-sg"
  description = "Web server to receive traffic from alb and bastion host"

  # VPC ID in which Security group has to be created!
  vpc_id = aws_vpc.vpc.id

 # Create an inbound rule for webserver HTTP access
  ingress {
    from_port   = 1
    to_port     = 65535
    description = "HTTP to Webserver"
    protocol    = "tcp"
    security_groups = ["${aws_security_group.sg-alb.id}"]
  }
  

  # Create an inbound rule for SSH access
  ingress {
    description = "SSH from bastion-host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.sg-bastion.id}"]
  }

  # Outward Network Traffic from the server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-app-instance-sg"
  }
}


