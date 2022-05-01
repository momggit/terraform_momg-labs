resource "aws_security_group" "allow_splunk_extern" {
  name        = "${var.project_name}-allow_ports_splunk_extern"
  description = "Allow inbound traffic to splunk extern"
  vpc_id      = module.vpc.vpc_id #"${data.aws_vpc.selected.id}"

  ingress {
    from_port = 8065
    to_port   = 8065
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8088
    to_port   = 8088
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8089
    to_port   = 8089
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8191
    to_port   = 8191
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 9887
    to_port   = 9887
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9997
    to_port   = 9997
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}
