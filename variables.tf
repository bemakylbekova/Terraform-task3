variable "username" {
  type        = string
  sensitive   = true
  description = "DB username"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "DB password"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Alex_Patrascu"
  }
  description = "Resourse tags"
}
