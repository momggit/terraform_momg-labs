resource "aws_lb_listener" "alb_listener_80_momg" {
  count = var.create_lb ? 1 : 0
  load_balancer_arn = aws_lb.alb_momg[count.index].arn
  port              = 80
  protocol          = "HTTP"

  # default_action {
  #   target_group_arn = aws_lb_target_group.target_group_splunk.arn
  #   type             = "forward"
  # }
  default_action {
    type             = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "alb_listener_8080_momg" {
  count = var.create_lb ? 1 : 0
  load_balancer_arn = aws_lb.alb_momg[count.index].arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group_db.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "alb_listener_443_momg" {
  count = var.create_lb ? 1 : 0
  load_balancer_arn = aws_lb.alb_momg[count.index].arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = module.acm.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_splunk.arn
  }
}
