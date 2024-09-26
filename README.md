## Infrastructure Setup with Terraform

### Overview

This guide will walk you through setting up a modular infrastructure using Terraform on AWS. The infrastructure includes essential AWS resources such as VPCs, subnets, security groups, an Elastic Kubernetes Service (EKS) cluster, and support for RDS (if required). The Terraform configuration is designed to be reusable, scalable, and maintainable through modularization.

### Prerequisites

Before you begin, ensure you have the following installed:

- Terraform: Download and install Terraform from terraform.io

- AWS CLI: Install the AWS CLI and configure it with your AWS credentials. You can follow this guide.

- kubectl: Required for interacting with the EKS cluster. Install it by following the official guide.

### AWS Credentials

Make sure your AWS credentials are set up properly in the environment by running:
```bash
aws configure
```

This will prompt you to enter your AWS access key, secret key, default region, and output format.

### Directory Structure
```
.
├── 01-provider.tf          # Terraform provider configuration (AWS)
├── 02-vpc.tf               # VPC definition
├── 03-subnets.tf           # Subnet definitions (public/private)
├── 04-nat.tf               # NAT Gateway definition (if required)
├── 05-routes.tf            # Route tables and associations
├── 06-eks.tf               # EKS Cluster definition
├── 07-nodes.tf             # EKS worker node configuration
├── 08-iam-oidc.tf          # IAM OIDC provider for EKS
├── 09-igw.tf               # Internet Gateway definition
├── 10-iam-autoscaler.tf    # IAM Role for Cluster Autoscaler
├── 11-variables.tf         # Variables file
```

### Instructions for Setup

#### Step 1: Initialize Terraform

After cloning or copying the Terraform files, navigate to the root directory and run:
```bash
terraform init
```
This will initialize your working directory containing Terraform configuration files and download the necessary provider plugins (in this case, AWS).

#### Step 2: Review Variables

The 11-variables.tf file defines input variables that customize your infrastructure. Modify these values 
according to your environment:

#### Step 3: Plan the Infrastructure

Run the following command to see what infrastructure will be created. This allows you to review and verify the planned resources.

```
terraform plan
```

#### Step 4: Modularization

The Terraform code is organized into reusable modules for VPC, Subnets, EKS, IAM Role for a cluster autoscaler. To call this module, you can use the following syntax in the main configuration files:

```
module "eks_cluster_with_vpc" {
  source = "git@github.com:rahghoo/terraform-config.git"
  vpc_cidr = var.vpc_cidr
}

```

With this modularized approach, you can easily reuse components, scale the infrastructure, and make adjustments as needed without duplicating code. Each module is independently manageable and can be tailored to your specific infrastructure requirements.