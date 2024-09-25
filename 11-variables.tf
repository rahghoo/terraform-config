variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  default     = "rahghoo-aws"
}

variable "project_name" {
  description = "Name of resources in AWS"
  default     = "ppro"
}

variable "availability_zones" {
  description = "Name of resources in AWS"
  default     = ["eu-central-1a", cognigy"eu-central-1b"]
}

variable "cluster_name" {
  default     = "ppro"
  type        = string
  description = "AWS EKS CLuster Name"
  nullable    = false
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "AWS EKS CLuster Name"
}

variable "vpc_private_subnet_1" {
  default     = "10.0.0.0/19"
  type        = string
  description = "AWS EKS CLuster Name"
}

variable "vpc_private_subnet_2" {
  default     = "10.0.32.0/19"
  type        = string
  description = "AWS EKS CLuster Name"
}

variable "vpc_public_subnet_1" {
  default     = "10.0.64.0/19"
  type        = string
  description = "AWS EKS CLuster Name"
}

variable "vpc_public_subnet_2" {
  default     = "10.0.96.0/19"
  type        = string
  description = "AWS EKS CLuster Name"
}