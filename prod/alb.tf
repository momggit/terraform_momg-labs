resource "aws_lb" "alb_momg" {
  count = var.create_lb ? 1 : 0
  depends_on         = [module.vpc]
  name               = var.lb_name
  load_balancer_type = "application" #default
  ip_address_type    = "ipv4"        #default

  subnets = data.aws_subnets.public.ids

  security_groups = [
    "${aws_security_group.allow_http_anywhere.id}",
    "${aws_security_group.allow_https_anywhere.id}",
    "${aws_security_group.allow_http_8080_anywhere.id}",
    "${aws_security_group.allow_http_8000_anywhere.id}"
  ]

  internal     = false #default
  idle_timeout = 60    #default

  tags = {
    Name = "${var.lb_name}"
  }
  access_logs {
    bucket = var.s3_bucket_alb
    prefix = "ELB-logs"
    # enabled = true
  }
}
