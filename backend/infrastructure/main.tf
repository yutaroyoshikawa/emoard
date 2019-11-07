variable "access_key" {}
variable "secret_key" {}
variable "token" {}
variable "region" {
  default = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = ""
    key = ""
    region = "ap-northeast-1"
    profile = ""
  }
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  token = "${var.token}"
  region = "${var.region}"
}

module "base" {
  region = "${var.region}"
  source = "./modules"
}

