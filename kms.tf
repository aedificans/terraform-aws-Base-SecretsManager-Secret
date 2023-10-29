module "kms" {
  count = var.enable_encryption && var.kms_key_arn == null ? 1 : 0

  source  = "app.terraform.io/aedificans/Base-KMS-Key/aws"
  version = "1.0.0"

  naming              = var.naming
  environment         = var.environment
  description         = "A KMS Key for any ${local.naming.display} secret(s)"
  enable_key_rotation = var.enable_kms_key_rotation
  tagging             = var.tagging
}
