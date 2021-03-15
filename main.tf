module "riot" {
    source = "github.com/Redislabs-Solution-Architects/run_RIOT"
    region = var.region
    linux_ami = var.linux_ami
    instance_type = var.instance_type
    ssh_key_name = var.ssh_key_name
    security_group_id = var.security_group_id
}



resource "aws_elasticache_cluster" "source" {
    cluster_id           = "source"
    engine               = "redis"
    node_type            = "cache.t3.micro"
    num_cache_nodes      = 1
    port                 = 6379
}


module "memtier" {
    source = "/users/tobyferguson/Development/terraform_aws_memtier_benchmark"
    region = var.region
    linux_ami = var.linux_ami
    instance_type = var.instance_type
    ssh_key_name = var.ssh_key_name
    security_group_id = var.security_group_id
}
