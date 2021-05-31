resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Environment = var.target_env
  }
}

resource "aws_acm_certificate" "parks_reso_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Environment = var.target_env
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "parks_validation_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = aws_acm_certificate.parks_reso_cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.parks_reso_cert.domain_validation_options.0.resource_record_type
  records = [aws_acm_certificate.parks_reso_cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "parks_reso_cert_validation" {
  certificate_arn         = aws_acm_certificate.parks_reso_cert.arn
  validation_record_fqdns = [aws_route53_record.parks_validation_record.fqdn]
}