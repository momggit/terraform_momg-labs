#Rules port 80

resource "aws_lb_listener_rule" "listener_rule_splunk_80" {
  count = var.create_lb ? 1 : 0
  listener_arn = aws_lb_listener.alb_listener_80_momg[count.index].arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_splunk.arn
  }

  condition {
    host_header {
      values = ["splunk.*.${var.domain_lab}"]
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule_splunk_80_redirect" {
  count = var.create_lb ? 1 : 0
  listener_arn = aws_lb_listener.alb_listener_80_momg[count.index].arn
  priority     = 101


  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = ["splunk.*.${var.domain_lab}"]
    }
  }
}

#Rules port 8080
resource "aws_lb_listener_rule" "listener_rule_db_8080" {
  count = var.create_lb ? 1 : 0
  listener_arn = aws_lb_listener.alb_listener_8080_momg[count.index].arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_db.arn
  }

  condition {
    host_header {
      values = ["db.*.${var.domain_lab}"]
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule_db_8080_redirect" {
  count = var.create_lb ? 1 : 0
  listener_arn = aws_lb_listener.alb_listener_8080_momg[count.index].arn
  priority     = 103

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = ["db.*.${var.domain_lab}"]
    }
  }
}


#Rules port 443
resource "aws_lb_listener_rule" "listener_rule_splunk_443" {
  count = var.create_lb ? 1 : 0
  listener_arn = aws_lb_listener.alb_listener_443_momg[count.index].arn
  priority     = 104


  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_splunk.arn
  }

  condition {
    host_header {
      values = ["splunk.*.${var.domain_lab}"]
    }
  }
}
