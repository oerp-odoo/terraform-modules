resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "${var.tag_name}"
  }
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}
