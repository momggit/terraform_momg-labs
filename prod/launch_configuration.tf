resource "aws_launch_configuration" "bastion" {
  name_prefix   = "${var.project_name}-bastion"
  image_id      = data.aws_ami.ami_bastion.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair_bastion.key_name

  security_groups = [
    "${aws_security_group.allow_ssh_anywhere.id}",
    "${aws_security_group.allow_ssh_intern.id}",
    "${aws_security_group.allow_http_8000_intern.id}",
    "${aws_security_group.allow_http_intern.id}"
  ]

  user_data_base64 = base64encode(data.template_file.user-data-bastion.rendered)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "proxy" {
  count = var.number_of_instances_proxy == 1 ? 1 : 0
  name_prefix   = "${var.project_name}-proxy"
  image_id      = data.aws_ami.ami_bastion.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair_bastion.key_name

  security_groups = [
    "${aws_security_group.allow_ssh_anywhere.id}",
    "${aws_security_group.allow_proxy_intern.id}",
    #"${aws_security_group.allow_http_8000_intern.id}",
  ]

  user_data_base64 = base64encode(data.template_file.user-data-proxy.rendered)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "splunk" {
  count = var.create_proxy? 1:0
  name_prefix   = "${var.project_name}-lc_"
  image_id      = data.aws_ami.ami_splunk.id
  instance_type = var.instance_type_splunk
  key_name      = aws_key_pair.keypair_lab.key_name

  security_groups = [
    "${aws_security_group.allow_ssh_intern.id}",
    # "${aws_security_group.allow_http_8000_intern.id}",
    # "${aws_security_group.allow_splunk_intern.id}",
    "${aws_security_group.allow_http_8000_anywhere.id}",
    "${aws_security_group.allow_splunk_extern.id}"
  ]

  root_block_device {
    volume_size           = var.EC2_SPLUNK_VOLUME_SIZE
    volume_type           = var.EC2_SPLUNK_VOLUME_TYPE
    delete_on_termination = var.EC2_SPLUNK_VOLUME_DELETE_ON_TERMINATION
  }

  user_data_base64 = base64encode(data.template_file.user-data-splunk[count.index].rendered)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "web" {
  count = var.create_proxy && var.create_db? 1:0
  name_prefix   = "${var.project_name}-lc_"
  image_id      = data.aws_ami.ami_web.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair_lab.key_name

  security_groups = [
    "${aws_security_group.allow_ssh_intern.id}",
    "${aws_security_group.allow_http_intern.id}"
  ]

  user_data_base64 = base64encode(data.template_file.user-data-web[count.index].rendered)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "db" {
  count = var.create_proxy? 1:0
  name_prefix   = "${var.project_name}-lc_"
  image_id      = data.aws_ami.ami_db.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair_lab.key_name

  security_groups = [
    "${aws_security_group.allow_ssh_intern.id}",
    "${aws_security_group.allow_db_intern.id}"
  ]

  user_data_base64 = base64encode(data.template_file.user-data-db[count.index].rendered)

  lifecycle {
    create_before_destroy = true
  }
}
