# Terraform AWS Two-Tier Architecture Project

This project provisions a secure two-tier infrastructure on AWS using Terraform.  
It demonstrates real-world cloud networking concepts including public and private subnets, NAT Gateway routing, and security group isolation.

---

## 🏗 Architecture Overview

The infrastructure includes:

- Custom VPC
- Public Subnet (Web Tier)
- Private Subnet (Database Tier)
- Internet Gateway
- NAT Gateway for outbound internet access from private subnet
- Route Tables and Associations
- EC2 Web Server with automated configuration (user data)
- EC2 Database Server in private network
- Security Groups with least-privilege access

### Traffic Flow

Internet → Web Server (Public Subnet)  
Web Server → Database Server (Private Subnet)  
Database Server → Internet via NAT Gateway  

---

## 🚀 Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- Security Groups
- Bash (user_data script)

---

## 📂 Project Structure

```bash
terraform-aws-two-tier-architecture/
├── provider.tf
├── variables.tf
├── network.tf
├── security.tf
├── compute.tf
├── user_data.sh
├── README.md
└── .gitignore

