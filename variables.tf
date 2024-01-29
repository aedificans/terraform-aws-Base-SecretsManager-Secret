#==================#
# Naming & Tagging #
#==================#

variable "environment" {
  description = "A naming object for the environment to provide both the environment's name and abbrevation for tagging and reporting purposes"
  type = object({
    name         = string
    abbreviation = string
  })
  default = null

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.environment.name)) || var.environment == null
    error_message = "The environment name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-]*$", var.environment.abbreviation)) || var.environment == null
    error_message = "The environment abbreviation must be kebab case"
  }
}
variable "naming" {
  description = "A naming object to provide the display name of the service from the service catalog, and optionally also a resource name"
  type = object({
    display  = string
    resource = optional(string, null)
  })

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.naming.display))
    error_message = "The secret display name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-/]*$", var.naming.resource)) || var.naming.resource == null
    error_message = "If provided, the secret resource name must be kebab case with an optional path structure using `/`s"
  }
}
variable "tagging" {
  description = "A collection of tags as key-value pairs to be applied to all applicable provisioned resources"
  type = object({
    additional_tags = optional(map(any), {})
    network         = optional(string, null)
    organization    = string
    owner           = string
    service_name    = optional(string, null)
    service_pattern = string
    tag_key_prefix  = string
  })
}

#==================#
# Resource Configs #
#==================#

variable "description" {
  type        = string
  description = "A brief description of what this secret is intended for"
}
variable "recovery_window_in_days" {
  type        = number
  default     = 0
  description = "The number of days to persist a secret after deletion for recovery"
}
variable "enable_encryption" {
  type        = bool
  default     = true
  description = "Specifies whether or not to leverage a KMS Key to encrypt the secret"
}
variable "enable_kms_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}
variable "kms_key_arn" {
  type        = string
  default     = null
  description = "The ARN for the KMS Key to be used for encrypting the secret"
}
variable "secret_string" {
  type        = string
  default     = null
  description = "A secret string"
}
