resource "aws_eip" "nat_gateway_a" {
  vpc        = true
  depends_on = ["aws_internet_gateway.main_gateway"]
}

resource "aws_eip" "nat_gateway_b" {
  vpc        = true
  depends_on = ["aws_internet_gateway.main_gateway"]
}

resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = "${aws_eip.nat_gateway_a.id}"
  subnet_id     = "${aws_subnet.public_a.id}"
  depends_on    = ["aws_nat_gateway.nat_gateway_a"]
}

resource "aws_nat_gateway" "nat_gateway_b" {
  allocation_id = "${aws_eip.nat_gateway_b.id}"
  subnet_id     = "${aws_subnet.public_b.id}"
  depends_on    = ["aws_nat_gateway.nat_gateway_b"]
}
