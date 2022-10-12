variable "region" {
  type        = string
  description = "The AWS Region."
}

variable "switch_role_arn" {
  type        = string
  description = "Switch Role ARN do cliente."
}

variable "name" {
  type        = string
  description = "Used to name resources and prefixes."
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "namespace" {
  type        = string
  description = "VPC name"
}

variable "stage" {
  type        = string
  description = "VPC name"
}

variable "subnets" {
  type        = list(string)
  description = "subnets IDs"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
}

variable "cluster_size" {
  type        = number
  description = "Number of nodes in cluster"
}

variable "instance_type" {
  type        = string
  description = "Elastic cache instance type"
}

variable "family" {
  type        = string
  description = "Redis family"
}

variable "engine_version" {
  type        = string
  description = "Redis engine version"
}

variable "at_rest_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable encryption at rest"
}

variable "transit_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable TLS"
}

variable "zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
}

variable "cloudwatch_metric_alarms_enabled" {
  default     = false
  type        = bool
  description = "Boolean flag to enable/disable CloudWatch metrics alarms"
}
