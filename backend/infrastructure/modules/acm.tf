resource "aws_acm_certificate" "emoard" {
  domain_name               = "${aws_route53_zone.emoard.name}"
  subject_alternative_names = []
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "emoard" {
  certificate_arn         = "${aws_acm_certificate.emoard.arn}"
  validation_record_fqdns = ["${aws_route53_record.validation.fqdn}"]
}
