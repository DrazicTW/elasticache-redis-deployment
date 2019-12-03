# elasticache-redis-deployment

##
## Create Multiple AWS Elasticache Redis Clusters With Terrafrom
##

### Prerequisites
* Download terrafrom from: https://www.terraform.io/downloads.html
* Follow the instructions and add terraform executable to PATH: https://learn.hashicorp.com/terraform/getting-started/install.html 
* Edit your ~/.aws/credentials and add a terraform section:
  ```terrafrom
  [terraform]
  aws_access_key_id = __id__
  aws_secret_access_key = __key__
  ```
### Mandatory variables in terrafrom.tfvars
```terrafrom
#################
# Vars
#################
aws_credential          = ""                                 # Cred position, e.g. "/root/.aws/credentials"
aws_profile             = ""                                 # AWS profile name
aws_region              = ""                                 # aws region name
vpc_id                  = ""                                 # existing vpc id
redis_sg_ingress_cidr   = ""                                 # cidr open for inbound port 6379
redis_sg_egress_cidr    = ""                                 # cidr open for outbound
elasticache_list        = []                                 # list of Elasticache Redis attributes
 e.g.- name                        = "cluster-1"
     - instance_type               = "cache.t3.micro"
     - number_node                 = 3
     - engine_version              = "5.0.5"
     - subnet_group_name           = "test"
     - parameter_group_name        = "default.redis5.0"
     - maintenance_window          = "sat:18:00-sat:19:00"
     - snapshot_window             = "17:00-18:00"
     - snapshot_retention_limit    = 2
```

### Run Terrafrom 
* cd to the terraform directory and make sure you have all 3 files: 
```terrafrom
main.tf
vars.tf
terraform.tfvars
```
* Run the following commands:
```terrafrom
terrafrom init
terrafrom plan
terrafrom apply
```
