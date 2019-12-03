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

}
