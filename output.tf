output "alb_dns_name" {
  value       = aws_lb.taskalb.dns_name
  description = "DNS name of ALB"
}

output "route53_dns" {
  value       = aws_route53_record.www.fqdn
  description = "Route53 DNS"
}