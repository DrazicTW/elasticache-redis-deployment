#################
# Provider
#################
provider "aws" {
  region                     = var.aws_region
  shared_credentials_file    = var.aws_credential
  profile                    = var.aws_profile
  skip_requesting_account_id = true
}

#################
# Resources
#################

module "redis-migration-test" {
  source = "../modules/aws.modules"
  vpc_id = var.vpc_id
  redis_sg_ingress_cidr = var.redis_sg_ingress_cidr
  redis_sg_egress_cidr = var.redis_sg_egress_cidr
  elasticache_list = var.elasticache_list
}
