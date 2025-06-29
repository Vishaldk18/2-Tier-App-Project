variable "region"{
    description = "AWS Region"
    type = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}


varibale "ami_id"{
   description = "AMI ID"
   type = string
   default = "ami-05fcfb9614772f051"
}

variable "instance_type"{
  description = "instance type"
  type = string
  default = "t3.micro"
}


varible "db_engine"{
  description = "DB Engine type" 
  type = string
  default = "mysql"
}

var "db_instance_class"{
  description = "DB Instance type"
  type = string
  default = "db.t3.micro"
}