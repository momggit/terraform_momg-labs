#externs

resource "aws_security_group" "allow_ssh_anywhere" {
  name        = "${var.project_name}-allow_ssh_anywhere"
  description = "Allow all inbound traffic to ssh"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_nfs" {
  name        = "${var.project_name}-allow_nfs"
  description = "Allow nfs"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {

    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_http_anywhere" {
  name        = "${var.project_name}-allow_http_anywhere"
  description = "Allow all inbound traffic to http"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_https_anywhere" {
  name        = "${var.project_name}-allow_https_anywhere"
  description = "Allow all inbound traffic to https"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_http_8000_anywhere" {
  name        = "${var.project_name}-allow_http_8000_anywhere"
  description = "Allow all inbound traffic to http"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {
    from_port = 8000
    to_port   = 8000
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_http_8080_anywhere" {
  name        = "${var.project_name}-allow_http_8080"
  description = "Allow inbound traffic to http 8080"
  vpc_id      = module.vpc.vpc_id #"${data.aws_vpc.selected.id}"

  ingress {

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}


#Interns

resource "aws_security_group" "allow_ssh_intern" {
  name        = "${var.project_name}-allow_ssh_intern"
  description = "Allow incoming internal traffic to ssh"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    # cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_http_intern" {
  name        = "${var.project_name}-allow_http_intern"
  description = "Allow incoming internal traffic to http"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_security_group" "allow_http_8000_intern" {
  name        = "${var.project_name}-allow_http_8000_intern"
  description = "Allow inbound traffic to http 8000 intern"
  vpc_id      = module.vpc.vpc_id #"${data.aws_vpc.selected.id}"

  ingress {

    from_port = 8000
    to_port   = 8000
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["10.0.0.0/16"] #["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"] #["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}

