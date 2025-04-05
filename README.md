# AWS Key Pair Terraform Project

## Overview

This Terraform project creates an SSH key pair and distributes it to both AWS EC2 and AWS Lightsail services while securely saving the private key locally. The solution is ideal for managing consistent SSH access across different AWS services.

## Project Structure
```
terraform-ssh-key-pair/
│── main.tf                # Main Terraform configuration file
│── key-pair.tf            # AWS Key pair configuration file
│── outputs.tf             # Output values
│── README.md              # Documentation
```

## Features

- Generates a secure 4096-bit RSA key pair
- Creates an EC2 key pair in AWS
- Creates a Lightsail key pair in AWS
- Saves the private key locally with secure permissions (0400)
- Automatically generates unique key names with timestamps
- Outputs relevant information for easy reference

## Prerequisites
Before deploying this project, ensure you have the following installed:

### a. Install Terraform
- Download Terraform from the official site: [Terraform Download](https://www.terraform.io/downloads)
- Install it by following the instructions for your OS.
- Verify installation by running:
  ```sh
  terraform -version
  ```

### b. Configure AWS CLI
- Install AWS CLI: [AWS CLI Installation](https://aws.amazon.com/cli/)
- Configure it with your AWS credentials:
  ```sh
  aws configure
  ```
  Provide your AWS **Access Key**, **Secret Key**, **Region**, and **Output Format**.

### c. Set Up VS Code (Optional, but Recommended)
- Install **VS Code**: [Download Here](https://code.visualstudio.com/)
- Install **Terraform Extension**: Search for `HashiCorp Terraform` in VS Code Extensions.

---

## **Deployment Guide**

### Clone the Repository**
```sh
git clone https://github.com/shefreddy/terraform-ssh-key-pair.git
cd terraform-ssh-key-pair
```
### RUN terraform

### **Step 1: Initialize Terraform**
```sh
terraform init
```
- Downloads necessary provider plugins.
- Sets up Terraform backend.

### **Step 2: Plan Deployment**
```sh
terraform plan
```
- Shows what Terraform will create before applying changes.

### **Step 3: Apply Configuration**
```sh
terraform apply -auto-approve
```
- Provisions AWS resources automatically.

### **Step 4: Destroy Resources (Optional)**
If you want to delete all resources:
```sh
terraform destroy -auto-approve
```

---

## **Outputs**
Terraform will output **EC2, Lightsail and Private Key pair Name**, which you can use to access the website:
```sh
ec2_key_name aws_key_pair.ec2_key.key_name
lightsail_key_name aws_lightsail_key_pair.lightsail_key.name
private_key_saved_to local_file.private_key.filename
```

### **Author: Freddy Shema**

**📌 GitHub Profile:** [Freddy Shema](https://github.com/shefreddy)

