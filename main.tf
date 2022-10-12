## Providers AWS
provider "aws" {
  assume_role {
    role_arn = var.switch_role_arn
  }

  region = var.region
}


## Data
data "aws_vpc" "this" {
  id = var.vpc_id
}



#Redis
module "redis" {
  source = "cloudposse/elasticache-redis/aws"
  version = "0.40.0"

  availability_zones         = var.availability_zones
  namespace                  = var.namespace
  stage                      = var.stage
  name                       = var.name
  zone_id                    = var.zone_id
  vpc_id                     = var.vpc_id
  subnets                    = var.subnets
  cluster_size               = var.cluster_size
  instance_type              = var.instance_type
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = var.engine_version
  family                     = var.family
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  security_group_rules = [
    {
      type                     = "egress"
      from_port                = 0
      to_port                  = 65535
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0"]
      source_security_group_id = null
      description              = "Allow all outbound traffic"
    },
    {
      type                     = "ingress"
      from_port                = 0
      to_port                  = 65535
      protocol                 = "-1"
      cidr_blocks              = [data.aws_vpc.this.cidr_block]
      source_security_group_id = null
      description              = "Allow all inbound traffic from VPC cirdr"
    },
  ]  
}
