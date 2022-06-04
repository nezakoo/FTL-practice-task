output "ec2_application_public_ip" {
  description = "The public IP of the application instance"
  value       = module.ec2_application.public_ip
}
output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = aws_elb.elb_application.dns_name
}
output "vpc_id" {
  description = "The VPC id"
  value       = aws_vpc.prod_like.id
}
output "subnet_id" {
  description = "The subnet id"
  value       = aws_subnet.prod_like_public.id
}
