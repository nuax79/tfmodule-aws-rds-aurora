module "vpc" {

  source = "https://github.com/nuax79/tfmodule-aws-rds-aurora.git"

  context = var.context
  cidr    = "172.57.0.0/16"

  # for Route53 API routing for private dns
  enable_dns_hostnames  = true
  enable_dns_support    = true
  create_igw            = true

  azs                   = ["apne2-az1", "apne2-az2"]

  public_subnets        = ["172.57.1.0/24", "172.57.2.0/24"]
  public_subnet_names   = ["pub-a1", "pub-b1"]
  public_subnet_suffix  = "pub"
  public_subnet_tags    = {
    "kubernetes.io/cluster/${local.name_prefix}-eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  create_database_subnet_route_table      = true
  create_database_internet_gateway_route  = true
  database_subnets        =  [ "172.57.90.0/24", "172.57.91.0/24" ]
  database_subnet_names   = [ "data-a1", "data-b1"]
  database_subnet_suffix  = "data"
  # database_subnet_tags = {}
}


 