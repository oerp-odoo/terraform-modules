provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_security_group" "sg" {
  name = "${var.name}"
  description = "${var.description}"
  # vpc_id = "${var.vpc_id}"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ext_blocks}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "${var.bucket}"
    key = "${var.key}"
    region = "${var.aws_region}"
  }

}
