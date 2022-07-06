variable "INSTANCE_COUNT" {}
variable "INSTANCE_TYPE" {}
variable "COMPONENT" {}
variable "ENV" {}
variable "APP_VERSION" {}
variable "APP_PORT" {}
variable "LB_TYPE" {
  default = "public"
}

variable "LB_RULE_PRIORITY" {}

variable "MIN_SIZE" {}
variable "MAX_SIZE" {}