
data "aws_ami" "ami_db" {

  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["momg-db-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_web" {

  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["momg-web-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_splunk" {

  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["momg-splunk-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_bastion" {

  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["momg-generic-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_vpc" "selected" {
  id = module.vpc.vpc_id
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["momg-labs-private-*"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["momg-labs-public-*"]
  }
}

data "aws_instance" "proxy" {
  count = var.create_proxy? 1:0
  filter {
    name   = "image-id"
    values = [data.aws_ami.ami_bastion.id]
  }

  filter {
    name   = "tag:Name"
    values = ["momg-labs-proxy-asg"]
  }
}

data "aws_instance" "db"{
  count = var.create_proxy && var.create_db? 1:0
  filter {
    name   = "image-id"
    values = [data.aws_ami.ami_db.id]
  }
  filter {
    name   = "tag:Name"
    values = ["momg-labs-db-asg"]
  }
}

data "aws_route53_zone" "selected" {
  name         = "${var.domain_lab}."
  private_zone = false
}


data "aws_instance" "bastion" {
  count = var.create_bastion? 1:0
  filter {
    name   = "image-id"
    values = [data.aws_ami.ami_bastion.id]
  }
  filter {
    name   = "tag:Name"
    values = ["momg-labs-bastion-asg"]
  }
}

data "aws_instance" "splunk" {
  count = var.create_proxy && var.create_splunk? 1:0
  filter {
    name   = "image-id"
    values = [data.aws_ami.ami_splunk.id]
  }
  filter {
    name   = "tag:Name"
    values = ["momg-labs-splunk-asg"]
  }
}

