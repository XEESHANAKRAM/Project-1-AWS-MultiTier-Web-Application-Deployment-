module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "private-sg"
  description = "private intance"
  vpc_id      = module.vpc.vpc_id

  #ingress:
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  #Egress
  egress_rules = ["all-all"]
  tags         = local.common_tags

}