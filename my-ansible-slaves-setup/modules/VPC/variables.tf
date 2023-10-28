variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
    description = ""
}

variable "subnet_cidr_block" {
 type        = list(string)
 description = "subnets cidrs"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "VPC_avail_zone" {}
variable "vpc_env_prefix" {}


