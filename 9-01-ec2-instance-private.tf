module "ec2_private" {
  source = "terraform-aws-modules/ec2-instance/aws"

  depends_on = [module.vpc]
  for_each   = toset(["0", "1"])

  name = "${var.environment}-vm-${each.key}"

  instance_type          = "t2.micro"
  key_name               = "my-key"
  ami                    = data.aws_ami.myubuntu.id
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))
  user_data              = file("${path.module}/nginx-install.sh")

  tags = local.common_tags
}