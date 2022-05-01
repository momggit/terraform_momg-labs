resource "aws_security_group" "allow_db_intern" {
  name        = "${var.project_name}-allow_db_intern"
  description = "Allow incoming internal traffic to db"
  vpc_id      = module.vpc.vpc_id #data.aws_vpc.selected.id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["10.0.0.0/16"]
  }

  #phpmyadmin
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = ["10.0.0.0/16"] #["0.0.0.0/0"]
  }

  #Splunk uf
  ingress {
    from_port = 9997
    to_port   = 9997
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
    cidr_blocks = ["10.0.0.0/16"]
    # cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}
