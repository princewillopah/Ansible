variable "avail_zone" {
 type        = list(string)
 description = "Availability Zones!!!!"
 default     = ["eu-north-1a", "eu-north-1b"]
}
variable "env_prefix" {
  default = "xx"
  description = ""
}
