output "Application_Domain" {
  value = "http://${aws_instance.web_server.public_ip}"
  description = "Public domain to access the application"
}

output "DB_Host_Endpoint"{
    value = aws_db_instance.mysql.address
  description = "DB Host Endpoint For DB Connection"
} 