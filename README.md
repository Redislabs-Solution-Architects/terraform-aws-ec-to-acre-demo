Migrating between [Elasticache] and [Azure Cache for Redis Enterprise (ACRE)] is easy using [RIOT]

This module provides a simple, end to end demonstration of the process.

# Architecture
The system architecture is shown below:

![System Architecture](http://www.plantuml.com/plantuml/png/LOynQmCn38Lt_mfnUpBSc24aX0wP2g5xqSdAsVHi5rbU6lhV6nb3sqMWXxxtdavLKRIbpUNY6IQc-Q22ztiaM3cpe1QP02le2WydJ8fvtHWI9uqixmjd2WdbmsxIuhxTS1BsiK8jJOZ1BzF3ULHSi3BmXbKZ8GKsYicet_mKLq6D9KCeLNju2d-pRzVNDrCb5ZNKqLQQ1_ngml0OJkU-NIna-jVyVBcz68qa_AIDTsc1dSJTqRhK6c3VFlT7U_a0yspAFAGKki8qxdi5PnEUMxViZrzpZMlGGNNznDctjFq0)

(Diagram courtesy of [plantuml])

The EC2 instances are identical except for the software installed. They use the same ssh key, default VPC, security group etc. etc.

You will need to use the three access points:
- ssh-memtier: run the `memtier_benchmark` traffic generator to generate load into the elasticache databse
- ssh-riot: run the `riot-redis` tool to migrate data from elasticache to ACRE
- redisInsight: run [RedisInsight] to see the keys in ACRE

Connection instructions for these are printed out when you run Terraform (although there is an issue which means not everything is automated, unfortunately).

# Use Instructions
## Configuration
Create a file `terraform.tfvars` for the required input variables:

An example `terraform.tfvars`:
```
region = "us-east-1"
linux_ami = "ami-038f1ca1bd58a5790"
instance_type = "t3.micro"
ssh_key_name = "toby-kp"
security_group_id = "sg-09b9fcd952473779f"
```


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
