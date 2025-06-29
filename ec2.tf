resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}


resource "aws_instance" "web_server" {
  depends_on = [aws_db_instance.mysql]
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public-subnet.id
  security_groups = [aws_security_group.web_sg.id]
  
  user_data = templatefile("./scripts/user_data.sh", {
    db_host     = aws_db_instance.mysql.address,
    db_user     = var.db_username,
    db_password = var.db_password
  })

  tags = {
    Name = "web-server"
  }
}