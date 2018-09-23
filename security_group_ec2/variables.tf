variable "aws_region" {
  description = "AWS Region to deploy"
}
variable "name" {
  description = "Name of security group"
}
variable "description" {
  description = "Description of security group"
}
variable "ext_blocks" {
  description = "External IPs to allow connecting through Port 22"
  type = "list"
}
variable "bucket" {
  description = "Bucket name for S3"
}
variable "key" {
  description = "key path to state for S3"
}
