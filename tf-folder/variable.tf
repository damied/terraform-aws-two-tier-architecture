variable "aws_region" {
  type        = string
  description = "AWS region for the instance"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "101.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "101.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "101.0.2.0/24"

}