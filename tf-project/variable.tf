variable "aws_region" {
  type        = string
  description = "AWS region for the instance"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "CIDR block for the private subnet"

}

variable "allowed_ssh_ip" {
  type        = string
  description = "IP address allowed to access SSH"
}