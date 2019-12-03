variable "aws_credential" {
  type = string
}
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "redis_sg_ingress_cidr" {
  type = list
}
variable "redis_sg_egress_cidr" {
  type = list
}
variable "elasticache_list" {
  type = list(object({
    name                   = string
    instance_type          = string
    number_node            = number
    engine_version         = string
    subnet_group_name      = string
    parameter_group_name   = string
    maintenance_window     = string
    snapshot_window        = string
    snapshot_retention_limit  = number
    redis_src_address      = string
}))

}
