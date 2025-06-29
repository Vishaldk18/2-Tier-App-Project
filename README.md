### **2-Tier App Architecture with EC2 (Docker) + RDS (MySQL)**

# 🚀 2-Tier App Architecture with EC2 (Docker) + RDS (MySQL)
Web app runs in Docker on EC2. DB hosted on managed RDS instance.

## 📌 Project Overview
This project sets up a 2-tier cloud architecture where the frontend/backend runs in a Docker container on EC2, and the database is a MySQL instance in RDS.

## 🛠️ Tech Stack
- **Cloud Provider**: AWS
- **IaC**: Terraform
- **App Runtime**: Docker (on EC2)
- **Database**: Amazon RDS (MySQL)



## 📂 File Structure
```bash
2tier-app/
├── main.tf
├── rds.tf
├── ec2.tf
├── vpc.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── scripts/
│   └── user_data.sh
├── README.md
````

## 🚀 How to Deploy

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## 🔐 Security & Permissions

* DB in private subnet, only app server can connect on port 3306.
* Security groups restrict access between layers.

## 🧹 Teardown

```bash
terraform destroy
```

## 🧠 Lessons Learned

* Split architecture: App vs DB
* Using EC2 user\_data to run Docker containers
* Connecting Docker to RDS securely

## 👨‍💻 Author

[Vishal Khairnar](https://github.com/Vishaldk18)

````
