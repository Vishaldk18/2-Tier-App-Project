#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
systemctl enable docker

# Log the values to verify (for debugging)
echo "DB_HOST=${db_host}" >> /tmp/env_debug.txt
echo "DB_USER=${db_user}" >> /tmp/env_debug.txt




docker run --rm -p 80:3000 \
  -e DB_HOST="${db_host}" \
  -e DB_USER="${db_user}" \
  -e DB_PASSWORD="${db_password}" \
  -d philippaul/node-mysql-app:02
