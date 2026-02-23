output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.Public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id  
}

output "web_server_public_ip" {
  value = aws_instance.web_ec2.public_ip
}

output "db_server_private_ip" {
  value = aws_instance.db_ec2.private_ip
}

output "web_security_group_id" {
  value = aws_security_group.web_sg.id
}

output "db_security_group_id" {
  value = aws_security_group.db_sg.id
}

output "key_pair_name" {
  value = aws_key_pair.web_key.key_name
  sensitive = true
}