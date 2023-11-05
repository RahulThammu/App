output "alb_url" {
  description = "Public URL for Application Load Balancer"
  value       = aws_alb.alb.dns_name
}