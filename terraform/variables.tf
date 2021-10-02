# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to create things in."
  //default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "stack" {
  description = "Name of the stack."
  default     = "blazorshop"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "aws_ecr" {
  description = "AWS ECR "
}



variable "family" {
  description = "Family of the Task Definition"
  default     = "blazorshop"
}

variable "container_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "task_count" {
  description = "Number of ECS tasks to run"
  default     = 3
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "fargate-task-service-role" {
  description = "Name of the stack."
 
}

variable "db_instance_type" {
  description = "RDS instance type"
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "RDS DB name"
  default     = "blazorshopdb"
}

variable "db_user" {
  description = "RDS DB username"
  default     = "blsadmin"
}

# variable "db_password" {
#   description = "RDS DB password"
# }

variable "db_profile" {
  description = "RDS Profile"
  default     = "mysql"
}

variable "db_initialize" {
  description = "RDS initialize"
  default     = "yes"
}

variable "cw_log_group" {
  description = "CloudWatch Log Group"
  default     = "Blazorshop"
}

variable "cw_log_stream" {
  description = "CloudWatch Log Stream"
  default     = "fargate"
}

# Source repo name and branch

variable "source_repo_name" {
    description = "Source repo name"
    type = string
}

variable "source_repo_branch" {
    description = "Source repo branch"
    type = string
}


# Image repo name for ECR

variable "image_repo_name" {
    description = "Image repo name"
    type = string
}

