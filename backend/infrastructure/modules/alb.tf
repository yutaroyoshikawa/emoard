resource "aws_alb" "alb" {
  name                       = "emoard"
  internal                   = false
  load_balancer_type         = "application"
  idle_timeout               = 60
  enable_deletion_protection = false
  subnets = [
    "${aws_subnet.public_a.id}",
    "${aws_subnet.public_b.id}"
  ]
  security_groups = ["${aws_security_group.emoard.id}"]
}

resource "aws_alb_target_group" "emoard" {
  name                 = "emoard-target"
  vpc_id               = "${aws_vpc.vpc_main.id}"
  target_type          = "ip"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 300

  health_check {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  depends_on = ["aws_alb.alb"]
}

resource "aws_alb_listener" "alb_443" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${aws_acm_certificate.emoard.arn}"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.emoard.arn}"
  }
}

resource "aws_alb_listener_rule" "emoard" {
  listener_arn = "${aws_alb_listener.alb_443.arn}"
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.emoard.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/*"]
  }
}
