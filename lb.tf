module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [aws_security_group.allow_http_https_ssh.id]

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

  target_groups = [
    {
        backend_protocol = "HTTP"
        backend_port     = 80
        name     = "tf-example-lb-tg"
        target_type = "instance"
        port     = 80
        protocol = "HTTP"
        vpc_id   = module.vpc.vpc_id
    }
  ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}