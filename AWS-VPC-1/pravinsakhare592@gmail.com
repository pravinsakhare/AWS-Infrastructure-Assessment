# Task 1: AWS VPC Networking & Subnetting

## 📋 Overview
This project implements a highly available AWS VPC network infrastructure with public and private subnets distributed across multiple availability zones, following AWS best practices for security and scalability.

---

## 🏗️ Architecture Design Explanation

### Design Approach
I designed this VPC network following a multi-tier architecture pattern that separates public-facing resources from private backend services. The infrastructure spans two availability zones (us-east-1a and us-east-1b) to ensure high availability and fault tolerance. 

The VPC uses a /16 CIDR block (10.0.0.0/16) providing 65,536 IP addresses, which offers ample room for current needs and future expansion. I created two public subnets for internet-facing resources like load balancers and bastion hosts, and two private subnets for backend application servers and databases that don't require direct internet access.

The public subnets are configured with auto-assign public IP enabled and route internet traffic through an Internet Gateway. Private subnets route outbound traffic through a NAT Gateway located in a public subnet, allowing private instances to download updates and access external APIs without exposing them to inbound internet traffic. This architecture implements defense-in-depth security while maintaining necessary connectivity.

The multi-AZ deployment ensures that if one availability zone experiences issues, resources in the other zone remain operational. This design balances security, availability, and operational efficiency, making it suitable for production workloads.

---

## 📊 Infrastructure Components

### VPC Configuration
- **VPC ID:** `vpc-058175c600df5107a`
- **CIDR Block:** `10.0.0.0/16`
- **DNS Hostnames:** Enabled
- **DNS Resolution:** Enabled
- **Availability Zones:** us-east-1a, us-east-1b

### Subnets Created

| Subnet Name | Type | CIDR Block | Availability Zone | Auto-assign Public IP |
|-------------|------|------------|-------------------|----------------------|
| Public Subnet 1 | Public | 10.0.1.0/24 | us-east-1a | ✅ Enabled |
| Public Subnet 2 | Public | 10.0.2.0/24 | us-east-1b | ✅ Enabled |
| Private Subnet 1 | Private | 10.0.11.0/24 | us-east-1a | ❌ Disabled |
| Private Subnet 2 | Private | 10.0.12.0/24 | us-east-1b | ❌ Disabled |

### Gateway Configuration

**Internet Gateway (IGW)**
- Attached to VPC: `vpc-058175c600df5107a`
- Purpose: Enables internet connectivity for public subnets

**NAT Gateway**
- Deployed in: Public Subnet 1 (us-east-1a)
- Elastic IP: Allocated
- Connectivity Type: Public
- Purpose: Enables outbound internet access for private subnets

### Route Tables

**Public Route Table**
- **Routes:**
  - Local: 10.0.0.0/16 (default VPC route)
  - Internet: 0.0.0.0/0 → Internet Gateway
- **Associated Subnets:**
  - Public Subnet 1
  - Public Subnet 2

**Private Route Table**
- **Routes:**
  - Local: 10.0.0.0/16 (default VPC route)
  - Internet: 0.0.0.0/0 → NAT Gateway
- **Associated Subnets:**
  - Private Subnet 1
  - Private Subnet 2

---

## 🔢 CIDR Block Allocation & Rationale

### VPC CIDR Block: `10.0.0.0/16`

**Why this range?**
- Provides **65,536 total IP addresses** (65,534 usable)
- Uses RFC 1918 private address space, avoiding conflicts with public internet
- /16 mask offers excellent balance between address capacity and subnet flexibility
- Allows for creating up to 256 /24 subnets if needed for future growth
- Compatible with most corporate networks that typically use 172.16.x.x or 192.168.x.x ranges

### Public Subnet 1: `10.0.1.0/24` (us-east-1a)

**Why this range?**
- Provides **256 total IPs (251 usable)** after AWS reserves 5 IPs
- /24 subnet is ideal for public-facing resources which are typically fewer in number
- Low subnet number (1) makes it easy to identify as a public subnet
- Sufficient for load balancers, NAT gateways, and bastion hosts
- Leaves room for additional public subnets (10.0.2.x through 10.0.10.x)

### Public Subnet 2: `10.0.2.0/24` (us-east-1b)

**Why this range?**
- Same /24 sizing as Public Subnet 1 for consistency
- Sequential numbering (2) maintains logical organization
- Provides redundancy in second availability zone
- Mirrors capacity of Public Subnet 1 for balanced workload distribution

### Private Subnet 1: `10.0.11.0/24` (us-east-1a)

**Why this range?**
- Starting at 10.0.11.x creates clear separation from public subnets
- /24 provides **251 usable IPs** suitable for application servers
- The gap between 10.0.2.x and 10.0.11.x (addresses 3-10) reserved for future public subnets
- Numbering pattern makes subnet purpose immediately recognizable

### Private Subnet 2: `10.0.12.0/24` (us-east-1b)

**Why this range?**
- Sequential private subnet numbering (11, 12) maintains consistency
- Same capacity as Private Subnet 1 for uniform resource distribution
- Enables high availability by hosting redundant instances across AZs
- Leaves room for additional private subnets (10.0.13.x onwards) for database tiers or other isolated environments

### Overall CIDR Strategy Benefits

✅ **Scalability:** Can add up to 254 more /24 subnets without redesign  
✅ **Clarity:** Clear separation between public (1-10) and private (11+) ranges  
✅ **Flexibility:** Easy to add new tiers (DMZ, database, management subnets)  
✅ **Standardization:** /24 subnets are industry standard and easy to manage  
✅ **Future-proof:** Plenty of unused address space for growth  

---

## 📸 AWS Console Screenshots

### 1. VPC Overview
![VPC Configuration]()
*VPC created with CIDR 10.0.0.0/16, ID: vpc-058175c600df5107a*

### 2. Internet Gateway
![Internet Gateway](screenshots/02-internet-gateway.png)
*Internet Gateway attached to VPC for public subnet connectivity*

### 3. Subnets Configuration
![All Subnets](screenshots/03-subnets-overview.png)
*Four subnets created: 2 public (with auto-assign public IP) and 2 private subnets across two AZs*

### 4. Public Subnet Auto-assign IP Settings
![Public Subnet Settings](screenshots/04-public-subnet-settings.png)
*Auto-assign public IPv4 address enabled for public subnets*

### 5. NAT Gateway
![NAT Gateway](screenshots/05-nat-gateway.png)
*NAT Gateway deployed in public subnet with allocated Elastic IP*

### 6. Route Tables
![Route Tables Overview](screenshots/06-route-tables.png)
*Public and Private route tables with appropriate route configurations*

### 7. Public Route Table Details
![Public Route Table](screenshots/07-public-route-table.png)
*Public route table routes internet traffic (0.0.0.0/0) to Internet Gateway*

### 8. Public Route Table Subnet Associations
![Public Subnet Associations](screenshots/08-public-associations.png)
*Both public subnets associated with public route table*

### 9. Private Route Table Details
![Private Route Table](screenshots/09-private-route-table.png)
*Private route table routes internet traffic (0.0.0.0/0) to NAT Gateway*

### 10. Private Route Table Subnet Associations
![Private Subnet Associations](screenshots/10-private-associations.png)
*Both private subnets associated with private route table*

### 11. Final Network Topology
![Complete Infrastructure](screenshots/11-final-topology.png)
*Complete VPC infrastructure showing all components*

---

## 🛠️ Terraform Infrastructure as Code

The complete Terraform configuration for this infrastructure is available in `main.tf`.

### Quick Deployment

```bash
# Initialize Terraform
terraform init

# Review planned changes
terraform plan

# Deploy infrastructure
terraform apply

# Destroy resources when done
terraform destroy
```

### Key Terraform Resources Created

- `aws_vpc.main` - VPC with 10.0.0.0/16 CIDR
- `aws_internet_gateway.main` - Internet Gateway
- `aws_subnet.public_1` & `aws_subnet.public_2` - Public subnets
- `aws_subnet.private_1` & `aws_subnet.private_2` - Private subnets
- `aws_eip.nat` - Elastic IP for NAT Gateway
- `aws_nat_gateway.main` - NAT Gateway
- `aws_route_table.public` - Public route table
- `aws_route_table.private` - Private route table
- Route table associations for all subnets

---

## ✅ Deployment Validation

### Tests Performed

1. ✅ VPC created with correct CIDR block
2. ✅ Internet Gateway attached successfully
3. ✅ All 4 subnets created in correct availability zones
4. ✅ Public subnets have auto-assign public IP enabled
5. ✅ NAT Gateway deployed and in "Available" state
6. ✅ Public route table routes to Internet Gateway
7. ✅ Private route table routes to NAT Gateway
8. ✅ Subnet associations configured correctly
9. ✅ DNS resolution and hostnames enabled

### Network Flow Verification

**Public Subnet → Internet:**
Public Subnet → Internet Gateway → Internet ✅

**Private Subnet → Internet:**
Private Subnet → NAT Gateway → Internet Gateway → Internet ✅

**Internet → Public Subnet:**
Internet → Internet Gateway → Public Subnet ✅

**Internet → Private Subnet:**
❌ Blocked (no inbound route configured - security by design)

---

## 💰 Cost Considerations

### Free Tier Eligible Resources
- ✅ VPC (Free)
- ✅ Subnets (Free)
- ✅ Internet Gateway (Free)
- ✅ Route Tables (Free)

### Paid Resources
- ⚠️ **NAT Gateway:** ~$0.045/hour (~$32.40/month) + data transfer costs
- ⚠️ **Elastic IP:** Free while attached to running NAT Gateway, $0.005/hour if unused

**Total Estimated Cost:** ~$32-35/month (primarily NAT Gateway)

### Cost Optimization Tips
- NAT Gateway is the main cost driver
- Consider NAT instances for development environments
- Delete NAT Gateway when not actively using the infrastructure
- Use VPC endpoints for AWS services to reduce NAT Gateway data transfer costs

---

## 🗑️ Resource Cleanup

**IMPORTANT:** To avoid ongoing charges, delete resources in this order:

1. Delete NAT Gateway (wait 5 minutes for deletion)
2. Release Elastic IP
3. Delete route table associations
4. Delete custom route tables
5. Detach and delete Internet Gateway
6. Delete subnets
7. Delete VPC

Or simply run:
```bash
terraform destroy
```

---

## 🎓 Key Learnings

Through this implementation, I gained hands-on experience with:

- AWS VPC architecture and design principles
- CIDR block planning and subnet allocation strategies
- Multi-AZ deployment for high availability
- Public vs. private subnet configurations
- Internet Gateway and NAT Gateway functionality
- Route table configuration and subnet associations
- AWS networking security best practices
- Infrastructure as Code using Terraform
- Cost optimization considerations for AWS networking

---

## 🔐 Security Best Practices Implemented

✅ Private subnets isolated from direct internet access  
✅ NAT Gateway for controlled outbound access  
✅ Separate route tables for public and private tiers  
✅ Multi-AZ deployment for fault tolerance  
✅ RFC 1918 private IP addressing  
✅ Network segmentation by subnet tier  

---

## 📚 References

- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [AWS VPC Best Practices](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-best-practices.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [RFC 1918 - Private Address Space](https://tools.ietf.org/html/rfc1918)

---

## 📧 Contact

**Project Author:** [Pravin Sakhare]  
**03:** December 2025  

---

*This infrastructure was created for educational and assessment purposes. All resources were properly terminated after documentation to prevent unnecessary costs.*
