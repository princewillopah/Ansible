variable "EC2_avail_zone" {}
variable "EC2_env_prefix" {}
variable "subnet-1-id-for-EC2" {}
variable "subnet-2-id-for-EC2" {}
variable "vpc_id-for-EC2" {}
# variable "vpc_id-for-EC2-2" {}
variable "public_key_location" {
    default = "/home/princewillopah/.ssh/id_rsa.pub"
}

# variable "my-ip" {
#     default = "102.89.40.191/32"
# }
