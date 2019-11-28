variable "region" {
  default = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "emoard-terraform-state"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "emoard"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "emoard-terraform-state"
  versioning {
    enabled = true
  }
}

provider "aws" {
  region  = "${var.region}"
  profile = "emoard"
}

module "base" {
  source = "./modules"
}
