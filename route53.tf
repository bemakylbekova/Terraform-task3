data "aws_route53_zone" "eivhomes" {
  name         = "eivhomes.com"
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.eivhomes.zone_id
  name    = "web"
  type    = "CNAME"
  ttl     = "60"

  records = [aws_lb.taskalb.dns_name]
}