locals {
    ec_node = aws_elasticache_cluster.source.cache_nodes[0]
}

output "run_riot" {
    value = module.riot.run_riot
}

output "run_memtier" {
    value = "ssh -i ~/.ssh/${var.ssh_key_name}.pem ${module.memtier.user}@${module.memtier.host} '${module.memtier.program} -s ${local.ec_node.address} -p ${local.ec_node.port}'"
    description = "command to run memtier against the elasticache instance"
}

output "elasticache_node" {
    value = local.ec_node
    description = "elasticache node details"
}
