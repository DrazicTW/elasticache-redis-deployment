resource "aws_security_group" "elasticache-security-group" {
  name = "elasticache_redis_sg"
  description = "Security Group for ElastiCache"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = var.redis_sg_ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.redis_sg_egress_cidr
  }

  tags = {
    Terraform = "true"
  }
}

resource "aws_elasticache_replication_group" "redis" {
  count = length(var.elasticache_list)
  replication_group_id  = lookup(var.elasticache_list[count.index], "name", tostring(count.index))
  replication_group_description = lookup(var.elasticache_list[count.index], "name", tostring(count.index))
  node_type             = lookup(var.elasticache_list[count.index], "instance_type", "db.t3.micro")
  number_cache_clusters = lookup(var.elasticache_list[count.index], "number_node", 1)
  engine_version        = lookup(var.elasticache_list[count.index], "engine_version", "5.0.5")
  subnet_group_name     = lookup(var.elasticache_list[count.index], "subnet_group_name")
  parameter_group_name  = lookup(var.elasticache_list[count.index], "parameter_group_name", "default.redis5.0")
  maintenance_window    = lookup(var.elasticache_list[count.index], "maintenance_window", "sat:18:00-sat:19:00")
  snapshot_window       = lookup(var.elasticache_list[count.index], "snapshot_window", "17:00-18:00")
  snapshot_retention_limit   = lookup(var.elasticache_list[count.index], "snapshot_retention_limit", 7)
  port                  = 6379
  security_group_ids    = [aws_security_group.elasticache-security-group.id]
  automatic_failover_enabled    = true
  at_rest_encryption_enabled    = false
  transit_encryption_enabled    = false

#  provisioner "local-exec" {
#    command = "aws elasticache start-migration --replication-group-id replication_group_id -customer-node-endpoint-list \"Address='172.31.27.197',Port=6379\""
#  }

  tags = {
    Terraform = "true"
  }
}

