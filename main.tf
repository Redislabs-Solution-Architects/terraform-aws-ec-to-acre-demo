module "riot" {
    source = "github.com/Redislabs-Solution-Architects/run_RIOT"
    region = "us-east-1"
    linux_ami = "ami-038f1ca1bd58a5790"
    instance_type = "t3.micro"
    ssh_key_name = "toby-kp"
    security_group_id = "sg-09b9fcd952473779f"
}

output "run_riot" {
   value = module.riot.run_riot
   }


resource "aws_elasticache_cluster" "source" {
  cluster_id           = "source"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  port                 = 6379
}

output "memtier_args_for_elasticache_endpoints" {
    value = [ for n in aws_elasticache_cluster.source.cache_nodes: "-s ${n.address} -p ${n.port}"]
}

module "memtier" {
  source = "/users/tobyferguson/Development/terraform_aws_memtier_benchmark"
    region = "us-east-1"
    linux_ami = "ami-038f1ca1bd58a5790"
    instance_type = "t3.micro"
    ssh_key_name = "toby-kp"
    security_group_id = "sg-09b9fcd952473779f"
}

output "run_memtier" {
   value = module.memtier.run_memtier
   }


	
    
