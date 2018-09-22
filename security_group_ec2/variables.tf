variable "aws_region" {
  description = "AWS Region to deploy"
}
variable "name" {
  description = "Name of security group"
}
variable "description" {
  description = "Description of security group"
}
# variable "vpc_id" {
#   description = "Virtual Private Cloud ID to assign"
# }
variable "ext_blocks" {
  description = "External IPs to allow connecting through Port 22"
  default = "list"
}
