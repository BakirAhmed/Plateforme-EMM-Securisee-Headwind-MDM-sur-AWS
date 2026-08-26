variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "project_name" {
  type    = string
  default = "secure-emm-platform"
}

variable "vpc_cidr" {
  type    = string
  default = "10.42.0.0/16"
}

variable "instance_type" {
  description = "t3.small minimum, t3.medium recommandé"
  type        = string
  default     = "t3.small"
}

variable "admin_email" {
  description = "E-mail pédagogique utilisé pour le certificat Let's Encrypt (certbot)"
  type        = string
  default     = "formation@example.invalid"
}

variable "alert_email" {
  description = "E-mail de destination des alertes de sécurité (SNS)"
  type        = string
  default     = "security-alerts@example.invalid"
}
