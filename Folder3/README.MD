High Availability + Auto ScalingTask
Enhance your architecture by migrating to a highly available setup:

1. Create an Internet-facing Application Load Balancer (ALB)
2. Migrate the EC2 instance setup to private subnets
3. Create an Auto Scaling Group (ASG) for high availability across AZs
4. Attach the ALB to the ASG
5. Ensure proper routing (public → ALB → private EC2 instances)

Deliverables
1. Brief explanation of your HA architecture and traffic flow
2. Screenshots of:
a) ALB configuration
b) Target group
c) Auto Scaling Group
d) EC2 instances launched via ASG
3. GitHub link to your Terraform/CloudFormation code
*


Step1 : Prep — upload resume to S3
bucket name should be globally unique

![alt text](image-2.png)

block all public access:
![alt text](image-1.png)

Now upload your resume pdf here in bucket :
![alt text](image-3.png)

Why: keeping file in S3 lets all ASG instances download the resume on boot without manual SCP.


Step 2:

(1) Create IAM role for EC2 (via Console)

Goal: allow instances to read the S3 object and use Session Manager (no SSH required).

Steps:

Go to IAM → Roles → Create role.
![alt text](image-4.png)

Choose AWS service → EC2 → Next.

Attach managed policy: AmazonSSMManagedInstanceCore.
![alt text](image-5.png)

click on create role with given proper name and description:
![alt text](image-6.png)

Click Create inline policy (Policy editor opens in new tab):
![alt text](image-7.png)
Select JSON and paste:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::pravin-sakhare-resume-bucket/Prav1.pdf"
    }
  ]
}


now review and create the policy:
![alt text](image-8.png)



now create target group: 

4. Register Targets (Skip this)

📌 Important:

DO NOT add any instance now

Auto Scaling Group will attach instances automatically

![alt text](image-9.png)


click on create target group:
![alt text](image-10.png)


now we will create the application load balancer
![alt text](image-11.png)

click on create application load balancer:
![alt text](image-12.png)


In networking select your two public subnet:
![alt text](image-13.png)


🔶 5. Configure Listener

There should be a default listener:

HTTP : 80

Choose Forward to:
Pravin-TG


(This is the target group you created)
![alt text](image-14.png)

🎉 ALB is created!

Your ALB will show:

Status: provisioning → active within ~2 minutes

![alt text](image-15.png)


Perfect — now we create the Launch Template, which defines:


![alt text](image-16.png)


AMI (Ubuntu)
![alt text](image-17.png) # Select the instance type and key pair
Instance type

IAM role (to read S3 + SSM)

🔶 7. IAM Instance Profile

Scroll → find:

IAM instance profile


Select:

Pravin-InstanceRole
![alt text](image-18.png)

Security group (Instance-SG)

User data script (install Nginx + pull resume from S3)
#!/bin/bash
set -euo pipefail
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
apt-get install -y nginx awscli
systemctl enable nginx
systemctl start nginx

# Download resume from S3 (instance role grants access)
aws s3 cp s3://pravin-sakhare-resume-bucket/Prav1.pdf /var/www/html/resume.pdf || true

# Create index.html embedding PDF
cat > /var/www/html/index.html <<'EOF'
<!doctype html>
<html><head><meta charset="utf-8"><title>Resume</title></head><body style="margin:0">
<h1 style="text-align:center">Pravin Sakhare — Resume</h1>
<div style="height:90vh"><embed src="resume.pdf" type="application/pdf" width="100%" height="100%"></div>
</body></html>
EOF

chown -R www-data:www-data /var/www/html
chmod 644 /var/www/html/resume.pdf || true

![alt text](image-19.png)

Make sure:
✔ Bucket name = pravin-sakhare-resume-bucket
✔ File name = Prav1.pdf


🔶 9. Create the Launch Template

Scroll down → click:

Create launch template

launch tamplate created:
![alt text](image-20.png)

Private subnet behavior (assigned by ASG later)

This template will be used by the Auto Scaling Group.


✅ STEP 6 — Create Auto Scaling Group (ASG)
🔶 1. Go to ASG section

Open EC2 Console

Left menu → Auto Scaling

Click Auto Scaling Groups

Click Create Auto Scaling group

![alt text](image-21.png)
🔶 2. Choose Launch Template

On the first page:

Auto Scaling group name:

Pravin-ASG


Launch Template:
Select:

Pravin-LT

in network setting choose your vpc and private subnet only:
![alt text](image-22.png)


now attach load balancer 
![alt text](image-23.png)


configuration gruop size and policies:
🔶 5. Configure Group Size

Set:

Desired capacity:

2


Minimum capacity:

2


Maximum capacity:

4


Why?

This ensures:

High availability

One EC2 in each private subnet

ASG can scale up to 4 if needed

Click Next.

![alt text](image-24.png)


add tag:
![alt text](image-25.png)


Auto scaling group created:
![alt text](image-26.png)

![alt text](image-27.png)