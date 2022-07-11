resource "random_password" "master" {
  length = 10
}

resource "aws_db_parameter_group" "example" {
  name        = "${module.aurora.cluster_name}-postgres11-parameter-group"
  family      = "aurora-postgresql11"
  description = "${module.aurora.cluster_name}-postgres11-parameter-group"
  tags        = module.aurora.tags
}

resource "aws_rds_cluster_parameter_group" "example" {
  name        = "${module.aurora.cluster_name}-postgres11-cluster-parameter-group"
  family      = "aurora-postgresql11"
  description = "${module.aurora.cluster_name}-postgres11-cluster-parameter-group"
  tags        = module.aurora.tags
}


module "aurora" {
  # source    = "git::https://github.com/bsp-dx/tfmodule-aws-vpc.git"
  source      = "../../"

  context                             = var.context
  engine                              = "aurora-postgresql"
  engine_version                      = "12.4"
  instance_type                       = "db.r5.large"
  instance_type_replica               = "db.t3.medium"

  vpc_id                              = module.vpc.vpc_id
  db_subnet_group_name                = module.vpc.database_subnet_group_name
  create_security_group               = true
  publicly_accessible                 = false
  allowed_cidr_blocks                 = concat(module.vpc.private_subnets_cidr_blocks, [module.vpc.vpc_cidr_block])

  replica_count                       = 2
  iam_database_authentication_enabled = true
  username                            = "root"
  password                            = "bespin!234"

  apply_immediately                   = false
  skip_final_snapshot                 = true

  db_parameter_group_name             = aws_db_parameter_group.example.id
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.example.id
  enabled_cloudwatch_logs_exports     = ["postgresql"]

  depends_on = [ module.vpc ]
}
