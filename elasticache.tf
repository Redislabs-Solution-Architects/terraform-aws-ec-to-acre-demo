terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticache_cluster" "source" {
    cluster_id           = "source"
    engine               = "redis"
    node_type            = "cache.t3.micro"
    num_cache_nodes      = 1
    port                 = 6379
}