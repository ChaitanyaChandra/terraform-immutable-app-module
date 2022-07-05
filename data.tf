data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "${var.COMPONENT}-${var.APP_VERSION}"
  owners      = ["self"]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-nonprod-state-chaitu-env"
    key    = "state/{var.ENV}/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "terraform-nonprod-state-chaitu-env"
    key    = "immutable/alb/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

