# variables.tf

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability zone within the region"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Amazon Machine Image ID for Ubuntu"
  type        = string
  default     = "ami-0d016af584f4febe3" # Ubuntu 22.04 LTS (us-east-1) ami-0d016af584f4febe3
}

variable "key_name" {
  description = "Name of your EC2 key pair"
  type        = string
  default     = "private_key" # Replace with your actual EC2 key pair name
}

variable "project_tag" {
  description = "Project tag name"
  type        = string
  default     = "ec2-web-server"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
