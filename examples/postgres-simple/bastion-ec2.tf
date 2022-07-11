data "aws_ami" "this" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name    = "tag:Name"
    values  = [ "bastion-ubuntu-18.04*" ]
  }
}

data "aws_iam_instance_profile" "this" {
  name = "ssm-ec2-role"
}

module "bastion-ec2" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "~> 2.0"

  instance_count = 1

  name          = "${local.name_prefix}-bastion-ec2"
  ami           = data.aws_ami.this.id
  instance_type = "t3.small"
  ebs_optimized = false
  key_name      = "test-an2-t-keypair"
  subnet_id     = tolist(module.vpc.public_subnets)[0]

  vpc_security_group_ids      = [module.vpc.default_security_group_id]
  associate_public_ip_address = true

  iam_instance_profile        = data.aws_iam_instance_profile.this.name

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 8
    },
  ]

  tags = merge(module.aurora.tags, {Name: "${local.name_prefix}-bastion-ec2"})



}
