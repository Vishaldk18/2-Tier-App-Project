resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}


resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private-subnet.id, aws_subnet.private-subnet2.id]

  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = "mysql-db"
  }
}