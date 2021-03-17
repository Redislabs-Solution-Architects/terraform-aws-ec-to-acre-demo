module "riot" {
    source = "github.com/Redislabs-Solution-Architects/run_RIOT"
    region = var.region
    linux_ami = var.linux_ami
    instance_type = var.instance_type
    ssh_key_name = var.ssh_key_name
    security_group_id = var.security_group_id
}
