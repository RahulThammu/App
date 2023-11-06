/*
#Create an ACM Certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.domain}"
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_route53_zone" "zone" {
  name = "${var.domain}"
}

resource "aws_route53_record" "dns" {
  allow_overwrite = true
  name =  tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
  records = [tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value]
  type = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
  zone_id = aws_route53_zone.zone.zone_id
  ttl = 60
}


resource "aws_acm_certificate_validation" "cert_validate" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.dns.fqdn]
}
*/