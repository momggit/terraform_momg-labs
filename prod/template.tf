
data "template_file" "file-env-db"{
  template = "${file(".env-db")}"
}

data "template_file" "file-env-web"{
  count = var.create_proxy && var.create_db? 1:0
  template = "${file(".env-web")}"
  vars = {
    db_ip = data.aws_instance.db[count.index].private_ip
  }
}

data "template_file" "file-env-splunk"{
  template = "${file(".env-splunk")}"
}

data "template_file" "file-server-splunk"{
  count = var.create_proxy? 1:0
  template = "${file("server.conf")}"
  vars = {
    proxy_ip = data.aws_instance.proxy[count.index].private_ip
  }
}

data "template_file" "user-data-proxy" {
  template = file("user-data-proxy.txt")

  vars = {
    USER   = "ubuntu"
    efs_id = "${aws_efs_file_system.momg-efs.id}"
    region = "${var.region}"
    repository_config_momg = "${var.repository_config_momg-labs}"
    token_github = "${var.token_github_config_momg-labs}"
  }
}

data "template_file" "user-data-bastion" {
  template = file("user-data-bastion.txt")

  vars = {
    USER   = "ubuntu"
    efs_id = "${aws_efs_file_system.momg-efs.id}"
    region = "${var.region}"
    repository_config_momg = "${var.repository_config_momg-labs}"
    token_github = "${var.token_github_config_momg-labs}"
  }
}

data "template_file" "user-data-db" {
  count = var.create_proxy? 1:0

  template = file("user-data-db.txt")

  vars = {
    USER   = "ubuntu"
    efs_id = "${aws_efs_file_system.momg-efs.id}"
    region = "${var.region}"
    repository_config_momg = "${var.repository_config_momg-labs}"
    token_github = "${var.token_github_config_momg-labs}"
    file_env = data.template_file.file-env-db.rendered
    proxy_ip = data.aws_instance.proxy[count.index].private_ip
  }
}

data "template_file" "user-data-web" {
  count = var.create_proxy && var.create_db ? 1:0
  template = file("user-data-web.txt")

  vars = {
    USER   = "ubuntu"
    efs_id = "${aws_efs_file_system.momg-efs.id}"
    region = "${var.region}"
    repository_config_momg = "${var.repository_config_momg-labs}"
    token_github = "${var.token_github_config_momg-labs}"
    file_env = data.template_file.file-env-web[count.index].rendered
    proxy_ip = data.aws_instance.proxy[count.index].private_ip
  }
}

data "template_file" "user-data-splunk" {
  count = var.create_proxy? 1:0
  template = file("user-data-splunk.txt")

  vars = {
    USER   = "ubuntu"
    efs_id = "${aws_efs_file_system.momg-efs.id}"
    region = "${var.region}"
    repository_config_momg = "${var.repository_config_momg-labs}"
    token_github = "${var.token_github_config_momg-labs}"
    file_env = data.template_file.file-env-splunk.rendered
    server_conf = data.template_file.file-server-splunk[count.index].rendered
    proxy_ip = data.aws_instance.proxy[count.index].private_ip
  }
}
