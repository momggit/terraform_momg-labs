resource "aws_route53_record" "db" {
  count = var.create_lb ? 1 : 0
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "db.momg-labs.ca"
  type    = "A"

  alias {
    name                   = aws_lb.alb_momg[count.index].dns_name
    zone_id                = aws_lb.alb_momg[count.index].zone_id
    evaluate_target_health = false
  }  
}

resource "aws_route53_record" "web" {
  count = var.create_lb ? 1 : 0
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "web.momg-labs.ca"
  type    = "A"

  alias {
    name                   = aws_lb.alb_momg[count.index].dns_name
    zone_id                = aws_lb.alb_momg[count.index].zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "splunk" {
  count = var.create_lb ? 1 : 0
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "splunk.momg-labs.ca"
  type    = "A"

  alias {
    name                   = aws_lb.alb_momg[count.index].dns_name
    zone_id                = aws_lb.alb_momg[count.index].zone_id
    evaluate_target_health = false
  }
}
