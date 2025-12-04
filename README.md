# AWS Infrastructure Assessment

## 👨‍💻 About This Project

This repository contains my AWS infrastructure assessment showcasing hands-on experience with AWS services, networking, and infrastructure as code (Terraform). All resources follow AWS best practices for security, scalability, and high availability.

**Author:** [Pravin Sakhare]  
**Date:** 3 December 2025  
**AWS Region:** us-east-1

---

## 📋 Table of Contents

1. [Task 1: VPC Networking & Subnetting](#task-1-vpc-networking--subnetting)
2. [Task 2: [Task Name]](#task-2)
3. [Task 3: [Task Name]](#task-3)
4. [Task 4: [Task Name]](#task-4)
5. [Task 5: [Task Name]](#task-5)

---

## 🏗️ Task 1: VPC Networking & Subnetting

### Objective
Design and configure a highly available AWS VPC with public and private subnets across multiple availability zones.

### Key Components
- 1 VPC (10.0.0.0/16)
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Custom Route Tables

### Architecture Highlights
✅ Multi-AZ deployment for high availability  
✅ Separate public/private subnet architecture  
✅ NAT Gateway for secure outbound internet access  
✅ Proper CIDR block allocation for scalability

📂 **[View Full Documentation →](./task-1-vpc-networking/)**

---

## 🛠️ Task 2: [Task Name]

### Objective
[Brief description]

### Key Components
- Component 1
- Component 2
- Component 3

📂 **[View Full Documentation →](./task-2-[name]/)**

---

## 🛠️ Task 3: [Task Name]

### Objective
[Brief description]

### Key Components
- Component 1
- Component 2
- Component 3

📂 **[View Full Documentation →](./task-3-[name]/)**

---

## 🛠️ Task 4: [Task Name]

### Objective
[Brief description]

### Key Components
- Component 1
- Component 2
- Component 3

📂 **[View Full Documentation →](./task-4-[name]/)**

---

## 🛠️ Task 5: [Task Name]

### Objective
[Brief description]

### Key Components
- Component 1
- Component 2
- Component 3

📂 **[View Full Documentation →](./task-5-[name]/)**

---

## 🛠️ Technologies Used

- **Cloud Platform:** AWS (Amazon Web Services)
- **Infrastructure as Code:** Terraform
- **Version Control:** Git & GitHub
- **AWS Services:** VPC, EC2, S3, IAM, RDS, etc.

---

## 📂 Repository Structure

Each task folder contains:
- `README.md` - Detailed explanation and architecture design
- `screenshots/` - AWS Console screenshots of deployed infrastructure
- `main.tf` - Terraform configuration files

---

## 🚀 How to Use This Repository

### Prerequisites
- AWS Account (Free Tier)
- AWS CLI configured
- Terraform installed (v1.0+)

### Deployment Steps
1. Navigate to specific task folder
2. Read the README.md for task-specific instructions
3. Initialize Terraform: `terraform init`
4. Review plan: `terraform plan`
5. Deploy: `terraform apply`
6. Clean up: `terraform destroy`

---

## ⚠️ Cost Management

All resources created in this assessment use AWS Free Tier eligible services where possible. Resources were created for demonstration purposes and **deleted immediately after documentation** to avoid unnecessary charges.

### Cost Considerations:
- NAT Gateway: ~$0.045/hour ($32/month)
- Elastic IPs: Free when attached, $0.005/hour when idle
- Most other resources (VPC, Subnets, IGW, Route Tables): **FREE**

---

## 🎓 Key Learnings

Throughout this assessment, I gained hands-on experience with:

- ✅ AWS VPC architecture and network design
- ✅ Multi-AZ deployment strategies
- ✅ Public and private subnet configuration
- ✅ NAT Gateway and Internet Gateway setup
- ✅ Route table management
- ✅ Infrastructure as Code using Terraform
- ✅ AWS security best practices
- ✅ Cost optimization strategies

---

## 📧 Contact

**Name:** [Pravin Sakhare]  
**Email:** [pravinsakhare592@gmail.com]  
**LinkedIn:** [https://www.linkedin.com/in/pravinsakhare/]  
**GitHub:** [https://github.com/pravinsakhare/]

---

## 📄 License

This project is for educational and assessment purposes.

---

## 🙏 Acknowledgments

This assessment demonstrates practical AWS infrastructure skills for cloud engineering and DevOps roles.
