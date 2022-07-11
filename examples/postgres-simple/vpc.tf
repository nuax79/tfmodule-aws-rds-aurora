module "vpc" {

  source = "git::https://github.com/bsp-dx/tfmodule-aws-vpc.git"

  context = var.context
  cidr    = "172.102.0.0/16"

  # for Route53 API routing for private dns
  enable_dns_hostnames = true
  enable_dns_support   = true

  # for default resources
  manage_default_security_group = true
  default_security_group_ingress = [{
    protocol  = -1
    from_port = 0
    to_port   = 0
    self      = true
  }]
  default_security_group_egress  = [{
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = "0.0.0.0/0"
  }]
  default_security_group_name = "${local.name_prefix}-default-sg"
  default_security_group_tags = {
    Name = "${local.name_prefix}-default-sg"
  }

  manage_default_route_table = true
  default_route_table_tags = {
    Name = "${local.name_prefix}-default-rt"
  }

  azs             = ["apne2-az1", "apne2-az2"]

  public_subnets  = ["172.102.1.0/24", "172.102.2.0/24"]
  public_subnet_names  = ["pub-a1", "pub-b1"]
  public_subnet_suffix = "pub"
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name_prefix}-eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  # one_nat_gateway_per_az = true

  private_subnets = [
    "172.102.50.0/24", "172.102.51.0/24",
    "172.102.52.0/24", "172.102.53.0/24"
  ]
  private_subnet_names = [
    "toolchain-a1","toolchain-b1",
    "dashboard-a1","dashboard-b1",
  ]
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name_prefix}-eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

  create_database_subnet_route_table = true
  database_subnets =  [ "172.102.90.0/24", "172.102.91.0/24" ]
  database_subnet_names = [ "data-a1", "data-b1"]
  database_subnet_suffix = "data"
  # database_subnet_tags = {}
}


 