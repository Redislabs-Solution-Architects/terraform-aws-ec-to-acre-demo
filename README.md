Migrating between [Elasticache] and [Azure Cache for Redis Enterprise (ACRE)] is easy using [RIOT]

This module provides a simple, end to end demonstration of the process.

# Architecture
The system architecture is shown below:

![System Architecture](http://www.plantuml.com/plantuml/png/JP2nQiGm38PtFuN8VZTalE6uu-ZGgN1qBugiYqrZkyZAqj1thnKyP0dHRttwX6vLKNHDYyl5CmnCuqK5Nwz8C7DcGIqo05RG6JOdJ8fvNXWI9uqiNnDd2WdbsthIvFvSdoJiOuLQLY46FmsRywWuOMNW1Qj6GWfi55EdkZ_5kMbZoH1ArLsUmj7zVF_uj5HYKKCTBMNrWB-hC6nzqdsl7YOPu4ZV7yytev646zruYaBjeTPm-1rTck0ayNIr1Li0v_NdVBKxN60SBHbxbCAUCFN-VIzdNsZLxhbnzktA_m00)

(Diagrams produced by embedding [plantuml] URLs as images)

The EC2 instances are identical except for the software installed. They use the same ssh key, default VPC, security group etc. etc.

# Installing Demo
Create a terraform template:
- Needs an [AWS provider] and [Azure provider], suitably configured.
- Must reference this module thus:
```
module "ec2acre" {
  source = "github.com/Redislabs-Solution-Architects/terraform_aws_azure_ec_to_acre_demo"
  region = 
  linux_ami =
  instance_type = 
  ssh_key_name =
  security_group_id =
```


[Elasticache]: https://aws.amazon.com/elasticache/
[RIOT]: https://developer.redislabs.com/riot/riot-redis.html
[Azure Cache for Redis Enterprise (ACRE)]: https://azuremarketplace.microsoft.com/en-us/marketplace/apps/garantiadata.redis_enterprise_1sp_public_preview?ocid=redisga_redislabs_cloudpartner_cta1
[ACRE]: https://azuremarketplace.microsoft.com/en-us/marketplace/apps/garantiadata.redis_enterprise_1sp_public_preview?ocid=redisga_redislabs_cloudpartner_cta1
[plantuml]: http://www.plantuml.com/
[AWS provider]: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
[Azure provider]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
