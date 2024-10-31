variable "name" {
  description = "Name of the parameter"
  type        = string
}

variable "type" {
  description = "Type of the parameter (String, SecureString)"
  type        = string
  default     = "SecureString"
}

variable "value" {
  description = "Value of the parameter"
  type        = string
}

variable "description" {
  description = "Description of the parameter"
  type        = string
  default     = ""
}
