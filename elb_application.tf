resource "aws_elb" "elb_application" {
  name    = "like-prod-elb-application"
  subnets = [aws_subnet.prod_like_public.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = [module.ec2_application.id]

  tags = merge(local.tags, {
    Name = "application_elb"
  })
}
