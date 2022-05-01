# Instance Attachment
# resource "aws_alb_target_group_attachment" "instance_splunk" {
#   target_group_arn = aws_lb_target_group.target_group_splunk.arn
#   target_id        = data.aws_instance.splunk.id
#   port             = 8000
# }

# Known bug
# alb_target_group_arn - (Optional, Deprecated use lb_target_group_arn instead) The ARN of an ALB Target Group.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment


#Autoscaling Attachment
resource "aws_autoscaling_attachment" "instance_splunk" {
  count = var.create_proxy? 1:0
  alb_target_group_arn = aws_lb_target_group.target_group_splunk.arn
  autoscaling_group_name = aws_autoscaling_group.splunk[count.index].id
}

resource "aws_autoscaling_attachment" "instance_db" {
  count = var.create_proxy? 1:0
  alb_target_group_arn = aws_lb_target_group.target_group_db.arn
  autoscaling_group_name = aws_autoscaling_group.db[count.index].id
}

resource "aws_autoscaling_attachment" "instance_web" {
  count = var.create_proxy && var.create_db? 1:0
  alb_target_group_arn = aws_lb_target_group.target_group_web.arn
  autoscaling_group_name = aws_autoscaling_group.web[count.index].id
}
