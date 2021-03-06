variable "region" {
    description = "Region into which to deploy the EC2 instance"
}

variable "linux_ami" {
    description = "Linux ami to use"
}

variable "instance_type" {
    description = "instance type to use. Default: t3.micro"
    default = "t3.micro"
}

variable "ssh_key_name" {
    description = "name of ssh key to be added to instance"
}

variable "security_group_id" {
    description = "Id of the security group applied to the instance"
}

variable "elasticache_node_type" {
    default = "cache.t3.micro"
    description = "Elasticache node type. Default: cache.t3.micro"
}

variable "client_id" {
  description = "Service Principal to use (az ad sp create-for-rbac ...)"
  sensitive = true
}

variable "client_secret" {
  description = "Client Secret for Service Principal"
  sensitive = true
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}



