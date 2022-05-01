resource "aws_lb_target_group" "target_group_splunk" {
  name        = "splunk-tg"
  port        = 8000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = module.vpc.vpc_id
  deregistration_delay = 30

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = "${var.target_group_splunk_sticky}"
  }
  health_check {
      healthy_threshold   = 3
      unhealthy_threshold = 10
      timeout             = 5
      interval            = 10
      path                = "${var.target_group_splunk_path}"
      port                = "${var.target_group_splunk_port}"
      matcher             = "${var.target_group_splunk_matcher}"
    }
}


resource "aws_lb_target_group" "target_group_db" {
  name     = "db-tg"
  port     = 8080
  protocol = "HTTP"
  target_type      = "instance"
  vpc_id   = module.vpc.vpc_id
  deregistration_delay = 30
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = "${var.target_group_db_sticky}"
  }
}


resource "aws_lb_target_group" "target_group_web" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  target_type      = "instance"
  vpc_id   = module.vpc.vpc_id
  deregistration_delay = 30

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = "${var.target_group_web_sticky}"
  }
  health_check {
      healthy_threshold   = 3
      unhealthy_threshold = 10
      timeout             = 5
      interval            = 10
      path                = var.target_group_web_path
      port                = var.target_group_web_port
      matcher             = var.target_group_web_matcher
    }
}
