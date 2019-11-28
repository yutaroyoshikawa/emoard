resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  gateway_id             = "${aws_internet_gateway.main_gateway.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "private_a" {
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_route_table" "private_b" {
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_route" "private_a" {
  route_table_id         = "${aws_route_table.private_a.id}"
  nat_gateway_id         = "${aws_nat_gateway.nat_gateway_a.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "private_b" {
  route_table_id         = "${aws_route_table.private_b.id}"
  nat_gateway_id         = "${aws_nat_gateway.nat_gateway_b.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_a" {
  route_table_id = "${aws_route_table.public.id}"
  subnet_id      = "${aws_subnet.public_a.id}"
}

resource "aws_route_table_association" "public_b" {
  route_table_id = "${aws_route_table.public.id}"
  subnet_id      = "${aws_subnet.public_b.id}"
}

resource "aws_route_table_association" "private_a" {
  route_table_id = "${aws_route_table.private_a.id}"
  subnet_id      = "${aws_subnet.private_a.id}"
}

resource "aws_route_table_association" "private_b" {
  route_table_id = "${aws_route_table.private_b.id}"
  subnet_id      = "${aws_subnet.private_b.id}"
}
