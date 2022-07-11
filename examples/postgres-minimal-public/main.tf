locals {
  my_public_cidr = [ "211.196.197.138/32" ]
}

module "aurora" {
  source      = "../../"

  context                             = var.context
  engine                              = "aurora-postgresql"
  engine_version                      = "12.4"
  instance_type                       = "db.r5.large"

  vpc_id                              = module.vpc.vpc_id
  db_subnet_group_name                = module.vpc.database_subnet_group_name
  create_security_group               = true
  publicly_accessible                 = true
  allowed_cidr_blocks                 = concat(module.vpc.private_subnets_cidr_blocks, [module.vpc.vpc_cidr_block],  local.my_public_cidr)

  iam_database_authentication_enabled = true
  username                            = "root"
  password                            = "password"

  apply_immediately                   = false
  skip_final_snapshot                 = true

  enabled_cloudwatch_logs_exports     = ["postgresql"]

  depends_on = [ module.vpc ]

}
