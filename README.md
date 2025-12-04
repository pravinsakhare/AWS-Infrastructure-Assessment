# 🚀 AWS Infrastructure Assessment

[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)](https://www.terraform.io/)
[![License](https://img.shields.io/badge/License-Educational-blue.svg)](LICENSE)

> **Comprehensive AWS infrastructure assessment showcasing hands-on experience with cloud services, networking, high availability, and Infrastructure as Code (Terraform).**

---

## 📋 Project Overview

This repository demonstrates practical AWS infrastructure skills through a series of progressively complex tasks. All implementations follow AWS best practices for **security**, **scalability**, and **high availability**.

**Author:** Pravin Sakhare  
**Date:** December 3, 2025  
**AWS Region:** us-east-1  
**Status:** ✅ Completed

---

## 📑 Table of Contents

- [Task 1: VPC Networking & Subnetting](#task-1-vpc-networking--subnetting)
- [Task 2: EC2 Web Hosting](#task-2-ec2-web-hosting)
- [Task 3: High Availability and Auto Scaling](#task-3-high-availability-and-auto-scaling)
- [Task 4: AWS Billing, Alarm Monitoring and Logging](#task-4-aws-billing-alarm-monitoring-and-logging)
- [Task 5: Highly Available and Scalable Architecture Diagram](#task-5-highly-available-and-scalable-architecture-diagram)
- [Tech Stack](#-tech-stack)
- [Repository Structure](#-repository-structure)
- [Getting Started](#-getting-started)
- [Cost Considerations](#-cost-considerations)
- [Key Learnings](#-key-learnings)
- [Contact](#-contact)

---

## 🌐 Task 1: VPC Networking & Subnetting

**Objective:** Design and configure a highly available AWS VPC with public and private subnets across multiple availability zones.

### Architecture Components

- **1 VPC** (CIDR: 10.0.0.0/16)
- **2 Public Subnets** (us-east-1a & us-east-1b)
- **2 Private Subnets** (us-east-1a & us-east-1b)
- **Internet Gateway** (for public internet access)
- **NAT Gateway** (for private subnet internet access)
- **Custom Route Tables** (public & private routes)

### Key Features

✅ Multi-AZ deployment for high availability and fault tolerance  
✅ Separate public/private subnet architecture for security  
✅ NAT Gateway for secure outbound internet access from private subnets  
✅ Proper CIDR block allocation for future scalability  
✅ Security groups and NACLs for defense in depth

### Implementation Details

The VPC architecture provides network isolation and segmentation, enabling secure deployment of both internet-facing and internal resources. Public subnets host resources like load balancers and bastion hosts, while private subnets host application servers and databases.

📂 **[View Task 1 Details →](./task-1/README.md)**

---

## 🖥️ Task 2: EC2 Web Hosting

**Objective:** Deploy and configure EC2 instances to host a web application with proper security and networking.

### Architecture Components

- **EC2 Instances** (t2.micro/t3.micro - Free Tier eligible)
- **Security Groups** (HTTP/HTTPS/SSH access control)
- **Elastic IP** (optional for static IP addressing)
- **User Data Scripts** (automated web server installation)
- **Key Pairs** (secure SSH access)

### Key Features

✅ Automated web server deployment using user data scripts  
✅ Security group configuration following principle of least privilege  
✅ Public subnet deployment for internet accessibility  
✅ Apache/Nginx web server hosting static content  
✅ SSH access restricted to specific IP ranges

### Implementation Details

EC2 instances are deployed in public subnets with Apache or Nginx web servers automatically installed via user data. Security groups allow HTTP (port 80) and HTTPS (port 443) from the internet, while SSH (port 22) is restricted to administrator IPs only.

📂 **[View Task 2 Details →](./task-2/README.md)**

---

## ⚖️ Task 3: High Availability and Auto Scaling

**Objective:** Implement a highly available and auto-scaling architecture for web applications.

### Architecture Components

- **Application Load Balancer (ALB)** (distributes traffic across AZs)
- **Auto Scaling Group (ASG)** (dynamic capacity management)
- **Launch Template** (EC2 instance configuration)
- **Target Groups** (health checks and routing)
- **CloudWatch Alarms** (scaling policies triggers)
- **Multiple Availability Zones** (fault tolerance)

### Key Features

✅ Application Load Balancer for intelligent traffic distribution  
✅ Auto Scaling based on CPU utilization or custom metrics  
✅ Multi-AZ deployment across us-east-1a and us-east-1b  
✅ Automatic health checks and instance replacement  
✅ Scaling policies: scale out at 70% CPU, scale in at 30% CPU  
✅ Minimum 2 instances, maximum 6 instances for optimal performance

### Implementation Details

The ALB sits in public subnets and distributes incoming traffic to EC2 instances in private subnets across multiple AZs. The Auto Scaling Group maintains application availability by automatically launching or terminating instances based on demand, ensuring optimal resource utilization and cost efficiency.

📂 **[View Task 3 Details →](./task-3/README.md)**

---

## 📊 Task 4: AWS Billing, Alarm Monitoring and Logging

**Objective:** Implement comprehensive monitoring, logging, and cost management solutions.

### Architecture Components

- **CloudWatch Billing Alarms** (cost threshold notifications)
- **AWS Budgets** (monthly spending limits)
- **CloudWatch Logs** (centralized logging)
- **CloudWatch Metrics** (performance monitoring)
- **SNS Topics** (email/SMS notifications)
- **VPC Flow Logs** (network traffic analysis)
- **CloudTrail** (API activity auditing)

### Key Features

✅ Billing alarm set at $10 threshold to prevent unexpected charges  
✅ SNS email notifications for cost overruns  
✅ CloudWatch monitoring for EC2, ALB, and RDS metrics  
✅ VPC Flow Logs for network security and troubleshooting  
✅ CloudTrail for compliance and security auditing  
✅ Custom dashboards for real-time infrastructure visibility  
✅ Log retention policies to optimize storage costs

### Implementation Details

Comprehensive monitoring ensures proactive issue detection and cost control. CloudWatch collects metrics from all AWS resources, while CloudTrail logs all API calls for security analysis. Billing alarms prevent unexpected costs by alerting when spending approaches defined thresholds.

📂 **[View Task 4 Details →](./task-4/README.md)**

---

## 🏗️ Task 5: Highly Available and Scalable Architecture Diagram

**Objective:** Design and document a production-ready, highly available, and scalable AWS architecture.

### Complete Architecture Overview

This task presents a comprehensive architectural diagram that integrates all previous tasks into a unified, enterprise-grade solution.

### Architecture Components

**Network Layer:**
- Multi-AZ VPC with public and private subnets
- Internet Gateway for public internet access
- NAT Gateways in each AZ for private subnet internet access
- Route 53 for DNS management

**Compute Layer:**
- Application Load Balancer across multiple AZs
- Auto Scaling Groups with dynamic scaling policies
- EC2 instances in private subnets
- Launch templates with user data automation

**Data Layer:**
- RDS Multi-AZ deployment for database high availability
- ElastiCache for application caching
- S3 buckets for static content and backups

**Security Layer:**
- Security groups with least privilege access
- Network ACLs for subnet-level security
- IAM roles and policies for service permissions
- AWS WAF for application-level protection

**Monitoring & Logging:**
- CloudWatch for metrics and alarms
- CloudTrail for audit logging
- VPC Flow Logs for network analysis
- SNS for notifications

### Key Features

✅ **High Availability:** Multi-AZ deployment eliminates single points of failure  
✅ **Scalability:** Auto Scaling automatically adjusts capacity based on demand  
✅ **Security:** Multiple layers of security controls (network, application, data)  
✅ **Performance:** Load balancing and caching optimize response times  
✅ **Cost Optimization:** Right-sized instances and auto-scaling reduce waste  
✅ **Monitoring:** Comprehensive observability across all components  
✅ **Disaster Recovery:** Automated backups and multi-AZ redundancy

### Architecture Principles

This architecture follows the **AWS Well-Architected Framework** across five pillars:

1. **Operational Excellence:** Automated deployments using Terraform
2. **Security:** Defense in depth with multiple security layers
3. **Reliability:** Multi-AZ redundancy and auto-recovery
4. **Performance Efficiency:** Right-sizing and auto-scaling
5. **Cost Optimization:** Pay only for what you use with dynamic scaling

📂 **[View Task 5 Details & Diagram →](./task-5/README.md)**

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Cloud Platform** | AWS (Amazon Web Services) |
| **Infrastructure as Code** | Terraform (v1.0+) |
| **Version Control** | Git & GitHub |
| **Compute** | EC2, Auto Scaling, Lambda |
| **Networking** | VPC, ALB, Route 53 |
| **Storage** | S3, EBS |
| **Database** | RDS (PostgreSQL/MySQL) |
| **Monitoring** | CloudWatch, CloudTrail |
| **Security** | IAM, Security Groups, WAF |
| **CI/CD** | AWS CodePipeline (optional) |

---

## 📁 Repository Structure

```
AWS-Infrastructure-Assessment/
│
├── README.md                          # Main documentation (this file)
├── LICENSE                            # License information
│
├── task-1-vpc-networking/
│   ├── README.md                      # Task 1 detailed documentation
│   ├── main.tf                        # VPC Terraform configuration
│   ├── variables.tf                   # Input variables
│   ├── outputs.tf                     # Output values
│   └── screenshots/                   # AWS Console screenshots
│       ├── vpc-overview.png
│       ├── subnets.png
│       └── route-tables.png
│
├── task-2-ec2-web-hosting/
│   ├── README.md                      # Task 2 detailed documentation
│   ├── main.tf                        # EC2 Terraform configuration
│   ├── user-data.sh                   # EC2 initialization script
│   └── screenshots/                   # Deployment screenshots
│
├── task-3-high-availability/
│   ├── README.md                      # Task 3 detailed documentation
│   ├── main.tf                        # ALB & ASG configuration
│   ├── scaling-policies.tf            # Auto Scaling policies
│   └── screenshots/                   # Architecture screenshots
│
├── task-4-monitoring/
│   ├── README.md                      # Task 4 detailed documentation
│   ├── main.tf                        # CloudWatch configuration
│   ├── alarms.tf                      # Billing and metric alarms
│   └── screenshots/                   # Monitoring dashboards
│
└── task-5-architecture-diagram/
    ├── README.md                      # Task 5 detailed documentation
    ├── architecture-diagram.png       # Complete architecture diagram
    └── architecture-explanation.md    # Detailed component breakdown
```

Each task folder contains:
- **README.md** - Detailed explanations, architecture decisions, and step-by-step guides
- **Terraform files** - Infrastructure as Code for reproducible deployments
- **screenshots/** - Visual documentation of AWS Console configurations

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have:

- [ ] **AWS Account** (Free Tier recommended)
- [ ] **AWS CLI** installed and configured
- [ ] **Terraform** installed (version 1.0 or higher)
- [ ] **Git** for version control
- [ ] **SSH key pair** for EC2 access
- [ ] Basic understanding of AWS services and networking

### Installation & Setup

1. **Configure AWS CLI**
   ```bash
   aws configure
   # Enter your AWS Access Key ID, Secret Access Key, Region (us-east-1), and output format
   ```

2. **Clone the Repository**
   ```bash
   git clone https://github.com/pravinsakhare/AWS-Infrastructure-Assessment.git
   cd AWS-Infrastructure-Assessment
   ```

3. **Navigate to Specific Task**
   ```bash
   cd task-1-vpc-networking/
   ```

4. **Initialize Terraform**
   ```bash
   terraform init
   ```

5. **Review Infrastructure Plan**
   ```bash
   terraform plan
   ```

6. **Deploy Infrastructure**
   ```bash
   terraform apply
   # Type 'yes' when prompted to confirm
   ```

7. **Verify Deployment**
   - Check AWS Console for created resources
   - Test connectivity and functionality
   - Review CloudWatch logs and metrics

8. **Clean Up Resources**
   ```bash
   terraform destroy
   # Type 'yes' when prompted to confirm
   ```

### ⚠️ Important Notes

- Always run `terraform destroy` after testing to avoid unnecessary charges
- Review the `terraform plan` output before applying changes
- Each task builds upon the previous one - complete them in order
- Screenshots and detailed instructions are in each task's README.md

---

## 💰 Cost Considerations

### Free Tier Resources

All resources in this assessment are designed to stay within AWS Free Tier limits where possible:

- **EC2 t2.micro/t3.micro:** 750 hours/month (Free for 12 months)
- **VPC, Subnets, IGW, Route Tables:** Always FREE
- **Elastic IPs:** Free when attached to running instances
- **S3:** 5GB storage, 20,000 GET requests, 2,000 PUT requests/month
- **RDS:** 750 hours of db.t2.micro, 20GB storage (Free for 12 months)
- **CloudWatch:** 10 custom metrics and alarms, 5GB log ingestion

### Paid Resources (Minimal Cost)

- **NAT Gateway:** ~$0.045/hour (~$32/month)
  - *Cost Optimization:* Use a single NAT Gateway or NAT instance for development
- **Application Load Balancer:** ~$0.0225/hour (~$16/month)
  - *Cost Optimization:* Destroy after testing
- **Data Transfer:** $0.09/GB outbound (first 10 GB/month free)

### Cost Management Best Practices

✅ Set up billing alarms (Task 4) before deploying resources  
✅ Use `terraform destroy` immediately after documentation  
✅ Enable AWS Cost Explorer for detailed cost analysis  
✅ Tag all resources for cost allocation tracking  
✅ Stop EC2 instances when not in use (vs. terminating)  
✅ Delete unused EBS volumes and snapshots  

**Total Estimated Cost:** This assessment can be completed for **under $5** if resources are created and destroyed within a few hours.

---

## 🎓 Key Learnings

Throughout this assessment, I gained practical, hands-on experience with:

### Technical Skills

✅ **AWS VPC Architecture** - Designing secure, scalable network architectures  
✅ **Multi-AZ Deployments** - Implementing fault-tolerant infrastructure  
✅ **Load Balancing** - Distributing traffic for high availability  
✅ **Auto Scaling** - Dynamic resource management based on demand  
✅ **Infrastructure as Code** - Terraform for repeatable, version-controlled deployments  
✅ **AWS Security** - IAM, Security Groups, NACLs, and encryption  
✅ **Monitoring & Logging** - CloudWatch, CloudTrail, and VPC Flow Logs  
✅ **Cost Optimization** - Right-sizing resources and using AWS Free Tier effectively

### AWS Best Practices

✅ **Security:** Defense in depth with multiple security layers  
✅ **Reliability:** Multi-AZ redundancy and automated recovery  
✅ **Performance:** Load balancing, caching, and CDN usage  
✅ **Cost Optimization:** Tagging, budgets, and right-sizing  
✅ **Operational Excellence:** IaC, automation, and monitoring  

### Professional Development

✅ **Problem Solving** - Troubleshooting real-world AWS issues  
✅ **Documentation** - Creating clear, comprehensive technical documentation  
✅ **Project Management** - Breaking complex tasks into manageable steps  
✅ **Cloud Architecture** - Designing production-ready solutions  

---

## 📬 Contact

**Pravin Sakhare**

- 📧 Email: [pravinsakhare592@gmail.com](mailto:pravinsakhare592@gmail.com)
- 💼 LinkedIn: [linkedin.com/in/pravinsakhare](https://www.linkedin.com/in/pravinsakhare/)
- 🐙 GitHub: [github.com/pravinsakhare](https://github.com/pravinsakhare/)
- 🌐 Portfolio: [Coming Soon]

Feel free to reach out for:
- Questions about this project
- AWS and cloud computing discussions
- Collaboration opportunities
- DevOps and infrastructure best practices

---

## 📄 License

This project is created for **educational and assessment purposes**. Feel free to use this as a reference for your own learning journey.

---

## 🙏 Acknowledgments

- AWS Documentation and best practices guides
- Terraform documentation and community
- Cloud computing and DevOps community

---

## ⭐ Star This Repository

If you found this project helpful, please consider giving it a star! It helps others discover this resource.

---

**Last Updated:** December 4, 2025

**Status:** ✅ Completed - All tasks documented and tested

---

> *This assessment demonstrates practical AWS infrastructure skills suitable for Cloud Engineer, DevOps Engineer, and Solutions Architect roles.*