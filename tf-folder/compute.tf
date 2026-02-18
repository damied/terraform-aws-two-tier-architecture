resource "aws_instance" "web_ec2" {
  ami = "ami-0c1fe732b5494dc14"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Public_subnet.id
  security_groups = [aws_security_group.web_sg.id]
  key_name = aws_key_pair.web_key.key_name
  user_data = file("user_data.sh")
     
     tags = {
        Name = "web-server"
    }

}

resource "aws_instance" "db_ec2" {
  ami = "ami-02777684819ca2214"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.db_sg.id] 
  associate_public_ip_address = false

    tags = {
        Name = "db-server"
    } 
}