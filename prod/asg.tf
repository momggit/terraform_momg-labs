resource "aws_autoscaling_group" "bastion" {
  depends_on           = [module.vpc]
  name                 = "bastion-asg"
  launch_configuration = aws_launch_configuration.bastion.name
  min_size             = 0
  max_size             = 1
  desired_capacity     = var.number_of_instances_bastion

  vpc_zone_identifier = data.aws_subnets.public.ids

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-bastion-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "proxy" {
  count = var.number_of_instances_proxy == 1 ? 1 : 0
  depends_on           = [module.vpc]
  name                 = "proxy-asg"
  launch_configuration = aws_launch_configuration.proxy[count.index].name
  min_size             = 0
  max_size             = 1
  desired_capacity     = var.number_of_instances_proxy

  vpc_zone_identifier = data.aws_subnets.public.ids

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-proxy-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "web" {
  depends_on           = [module.vpc]
  count = var.create_proxy && var.create_db? 1:0
  name                 = "web-asg"
  launch_configuration = aws_launch_configuration.web[count.index].name
  min_size             = 0
  max_size             = 1
  desired_capacity     = var.number_of_instances_web

  vpc_zone_identifier = data.aws_subnets.private.ids

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "db" {
  depends_on           = [module.vpc]
  count = var.create_proxy? 1:0
  name                 = "db-asg"
  launch_configuration = aws_launch_configuration.db[count.index].name
  min_size             = 0
  max_size             = 1
  desired_capacity     = var.number_of_instances_db

  vpc_zone_identifier = data.aws_subnets.private.ids

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-db-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "splunk" {
  count = var.create_proxy? 1:0
  depends_on           = [module.vpc]
  name                 = "splunk-asg"
  launch_configuration = aws_launch_configuration.splunk[count.index].name
  min_size             = 0
  max_size             = 1
  desired_capacity     = var.number_of_instances_splunk

  #private
  vpc_zone_identifier = data.aws_subnets.private.ids
  #public
  #vpc_zone_identifier = data.aws_subnets.public.ids

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-splunk-asg"
    propagate_at_launch = true
  }
}
