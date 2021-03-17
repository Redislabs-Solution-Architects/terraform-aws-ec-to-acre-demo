module "memtier" {
    source = "github.com/Redislabs-Solution-Architects/terraform_aws_memtier_benchmark"
    region = var.region
    linux_ami = var.linux_ami
    instance_type = var.instance_type
    ssh_key_name = var.ssh_key_name
    security_group_id = var.security_group_id
}
