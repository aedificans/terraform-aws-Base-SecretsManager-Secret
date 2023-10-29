output "arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = "The ARN of the secret"
}
output "name" {
  value       = aws_secretsmanager_secret.this.name
  description = "The Name attribute of the secret"
}
output "key_arn" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].arn : null
  description = "The ARN of the KMS Key"
}
output "key_id" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].id : null
  description = "The ID of the KMS Key"
}
output "key_alias" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].alias : null
  description = "The KMS Alias for the KMS Key"
}
output "key_encrypt_policy_arn" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].encrypt_policy_arn : null
  description = "The ARN of a policy that allows encryption access to the KMS Key"
}
output "key_decrypt_policy_arn" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].decrypt_policy_arn : null
  description = "The ARN of a policy that allows decryption access to the KMS Key"
}
output "key_bicrypt_policy_arn" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].bicrypt_policy_arn : null
  description = "The ARN of a policy that allows encryption and decryption access to the KMS Key"
}
output "key_full_access_policy_arn" {
  value       = var.enable_encryption && var.kms_key_arn == null ? module.kms[0].full_access_policy_arn : null
  description = "The ARN of a policy that allows full access to the KMS Key"
}
