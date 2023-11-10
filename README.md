# SecretsManager Secret

Terraform module which creates a SecretsManager Secret

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | app.terraform.io/aedificans/Base-KMS-Key/aws | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.string](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | A brief description of what this secret is intended for | `string` | n/a | yes |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | Specifies whether or not to leverage a KMS Key to encrypt the secret | `bool` | `true` | no |
| <a name="input_enable_kms_key_rotation"></a> [enable\_kms\_key\_rotation](#input\_enable\_kms\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | A naming object for the environment to provide both the environment's name and abbrevation for tagging and reporting purposes | <pre>object({<br>    name         = string<br>    abbreviation = string<br>  })</pre> | `null` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN for the KMS Key to be used for encrypting the secret | `string` | `null` | no |
| <a name="input_naming"></a> [naming](#input\_naming) | A naming object to provide the display name of the service from the service catalog, and optionally also a resource name | <pre>object({<br>    display  = string<br>    resource = optional(string, null)<br>  })</pre> | n/a | yes |
| <a name="input_recovery_window_in_days"></a> [recovery\_window\_in\_days](#input\_recovery\_window\_in\_days) | The number of days to persist a secret after deletion for recovery | `number` | `0` | no |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | A secret string | `string` | `null` | no |
| <a name="input_tagging"></a> [tagging](#input\_tagging) | A collection of tags as key-value pairs to be applied to all applicable provisioned resources | <pre>object({<br>    additional_tags = optional(map(any), {})<br>    network         = optional(string, null)<br>    organization    = string<br>    owner           = string<br>    service_name    = optional(string, null)<br>    service_pattern = string<br>    tag_key_prefix  = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the secret |
| <a name="output_key_alias"></a> [key\_alias](#output\_key\_alias) | The KMS Alias for the KMS Key |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The ARN of the KMS Key |
| <a name="output_key_bicrypt_policy_arn"></a> [key\_bicrypt\_policy\_arn](#output\_key\_bicrypt\_policy\_arn) | The ARN of a policy that allows encryption and decryption access to the KMS Key |
| <a name="output_key_decrypt_policy_arn"></a> [key\_decrypt\_policy\_arn](#output\_key\_decrypt\_policy\_arn) | The ARN of a policy that allows decryption access to the KMS Key |
| <a name="output_key_encrypt_policy_arn"></a> [key\_encrypt\_policy\_arn](#output\_key\_encrypt\_policy\_arn) | The ARN of a policy that allows encryption access to the KMS Key |
| <a name="output_key_full_access_policy_arn"></a> [key\_full\_access\_policy\_arn](#output\_key\_full\_access\_policy\_arn) | The ARN of a policy that allows full access to the KMS Key |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | The ID of the KMS Key |
| <a name="output_name"></a> [name](#output\_name) | The Name attribute of the secret |
<!-- END_TF_DOCS -->
