

variable "instance_names" {
  default = [
    "instance 1",
    "instance 2",
    "instance 3"
  ]
}

variable "file_name" {
  default = "/host-inventory"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "token" {
  description = "Name.com API token"
  type = string
}

variable "username" {
  description = "Name.com username"
  type = string
}

variable "vpc_cidr" {
  description = "cidr block and name tag for the vpc"
  type = object({
    cidr = string
    name = string
  })
}

variable "ssh_key" {
  description = "SSH Key name"
  type        = string
}

variable "subnet_cidr" {
  description = "cidr, availability zone and name tag for the subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "internet_gateway" {
  description = "internet gateway"
  type        = string
}

variable "route_table" {
  description = "cidr block and name tag for route table"
  type = object({
    cidr_block = string
    name       = string
  })
}

variable "security_group" {
  description = "Application load balancer and instances security group name"
  type        = list(string)
}

variable "inbound_ports" {
  description = "Security groups inbound ports"
  type        = list(number)
  default     = [80, 443]
}


variable "lb_name" {
  description = "Load balancer name"
  type = string
}

variable "tg_name" {
  description = "Target group name"
  type = string
}


variable "domain_names" {
  description = "Describes the domain and subdomain names"
  type = map(string)
}