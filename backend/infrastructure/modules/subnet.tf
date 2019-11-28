resource "aws_subnet" "public_a" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "public_b" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "private_a" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = "10.0.101.0/24"
}

resource "aws_subnet" "private_b" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = "10.0.102.0/24"
}
