variable "region" {
  type        = string
}

variable "cidr_block" {
  description = "cidr for the vpc"
  type        = string
}

variable "az_public" {
  description = "AZs for public subnet"
  type        = list(string)
}

variable "keypair" {
  description = "Adding the SSH authorized key"
  type        = string
}

variable "public_subnet_range" {
  description = "IP Range of this subnet"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type to use for the instance. "
  type        = string
}

variable "ami" {
  description = "AMI to use for the instance"
  type        = string
}

variable "ec2_ports" {
  description = "Container ports on ec2"
  type        = string
}

variable "az_private" {
  description = "AZs for private subnet"
  type        = list(string)
}

variable "private_subnet_range" {
  description = "IP Range of this subnet"
  type        = list(string)
}

variable "env" {
    description = "environment name"
    type        =  string
}

variable "domain" {
    description = "domain name for this environment"
    type        =  string
}

variable "access_key" {
    description = "aws access key"
    type        =  string
}

variable "secret_key" {
    description = "aws secret key"
    type        =  string
}