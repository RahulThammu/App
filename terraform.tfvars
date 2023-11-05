region = "eu-west-1"

keypair = "tf-deploy"

cidr_block = "10.0.0.0/16"

public_subnet_range  = ["10.0.1.0/24","10.0.2.0/24"]

az_private           = ["eu-west-1a","eu-west-1b"]

private_subnet_range  = ["10.0.3.0/24","10.0.4.0/24"]

az_public            = ["eu-west-1a","eu-west-1b"]

ami           = "ami-09dd5f12915cfb387"

instance_type = "t2.micro"

#container ports on ec2
ec2_ports = "3306"

env = "techtest"

domain = "techtest.com"