variable "aws_region" {
  description = "region where resources will be created"
  type        = string
  default     = "eu-west-2"
}

variable "cidr_block" {
  description = "cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_name" {
  description = "application name"
  type        = string
  default     = "portfolio"
}

variable "docker_image_url" {
  description = "url for docker image"
  type        = string
  default     = "257747315190.dkr.ecr.eu-west-2.amazonaws.com/flask-app:latest"
}
