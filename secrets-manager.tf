resource "aws_secretsmanager_secret" "this" {
  name = local.naming.resource
  kms_key_id = var.enable_encryption ? (
    var.kms_key_arn == null ? module.kms[0].arn : var.kms_key_arn
  ) : null
  recovery_window_in_days = var.recovery_window_in_days

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} Secret" })
  )
}
resource "aws_secretsmanager_secret_version" "string" {
  count = var.secret_string == null ? 0 : 1

  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.secret_string
}
