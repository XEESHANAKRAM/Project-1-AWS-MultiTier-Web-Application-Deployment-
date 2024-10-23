module "ec2_public" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.environment}-PublicHost"

  instance_type          = "t2.micro"
  key_name               = "my-key"
  ami                    = data.aws_ami.myubuntu.id
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]


  tags = local.common_tags
}