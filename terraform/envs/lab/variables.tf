variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "lab_name" {
  description = "Name prefix for lab resources"
  type        = string
  default     = "f5-awaf-lab"
}

variable "vpc_cidr" {
  description = "Lab VPC CIDR"
  type        = string
  default     = "10.90.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.90.1.0/24"
}

variable "az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "ca-central-1a"
}
