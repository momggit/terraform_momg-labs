resource "aws_security_group" "allow_proxy_intern" {
  name        = "${var.project_name}-allow_proxy_intern"
  description = "Allow inbound traffic to proxy intern"
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
  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["10.0.0.0/16"] #["0.0.0.0/0"]
  }

  ingress {

    from_port = 563
    to_port   = 563
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
