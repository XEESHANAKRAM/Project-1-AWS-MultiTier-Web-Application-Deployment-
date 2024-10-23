locals {
  owners      = var.business_division
  environment = var.environment
  name        = lower("${var.business_division}-${var.environment}")

  common_tags = {
    owner       = local.owners
    environment = local.environment
  }
}