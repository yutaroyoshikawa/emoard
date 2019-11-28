resource "aws_route53_zone" "emoard" {
  name = "emoard.app."
}


resource "aws_route53_record" "emoard" {
  name    = "${aws_route53_zone.emoard.name}"
  zone_id = "${aws_route53_zone.emoard.id}"
  type    = "A"

  alias {
    evaluate_target_health = true
    name                   = "${aws_alb.alb.dns_name}"
    zone_id                = "${aws_alb.alb.zone_id}"
  }
}

resource "aws_route53_record" "validation" {
  name    = "${aws_acm_certificate.emoard.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.emoard.domain_validation_options.0.resource_record_type}"
  records = ["${aws_acm_certificate.emoard.domain_validation_options.0.resource_record_value}"]
  zone_id = "${aws_route53_zone.emoard.id}"
  ttl     = 60
}
