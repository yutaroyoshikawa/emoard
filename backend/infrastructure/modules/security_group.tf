resource "aws_security_group" "emoard" {
  name   = "emoard"
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_security_group_rule" "ingress_emoard_http" {
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.emoard.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_emoard_https" {
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.emoard.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_emoard" {
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.emoard.id}"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
