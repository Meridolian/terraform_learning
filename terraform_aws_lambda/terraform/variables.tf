variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "AWS region"
}

variable "profile" {
  type        = string
  default     = "sandbox"
  description = "AWS user profile"
}

variable "runtime" {
  type        = string
  default     = "python3.9"
  description = "Lambda runtime"
}
