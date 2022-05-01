instance_type = "t2.micro"
project_name  = "momg-labs"
public_key_bastion = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRZaEiMqvU4cVL+OvRJoydaNwQqOM5pf/KI+3oGQA5sPbzOi2CWnlP8dsV/h2CxoCH0emiSFg8uXuc1V1FZbkiSQ7NS+MGeTJIT4VqgRPyGhaY+6NqHlGrgnq1tC2P4M7LVuGbukUB8WQGdbSlxCM5CZa3Alsd7boGiQUSb64UPi8z/xcCmN6N9LRHfab94iGESaEs43wKzscj5RcV/67UFryFHspPoOZj3VqSjaXjaBRm4nOVLlnNPvgq2B9wbhVONUewRLXMBJV43U+R+ygj6OkKww6WLPd0nBUnOyUgxKYvGbq7i3ImLe1x5XqlcSKSCZ2YVO6a3+9UIxzEy0qbZAJqHRJuFdDlX5u9C0qBSmx/zaNT/EvoEz8E2aHuC/VC/M5fQG9zZHbxSZLrhFsWrtdWTLUJUpK2Rpk7OUEEIK7e3U+jQU9FXcJ+5+t2P3nlHMWAHBx0wAlPQR/87ks3HF7Bm/59am0qf8sG+fY62UiL9qu8SPVrXhIgLjFKY8M= alemeji@MEJIA"
public_key_labs    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsz55h83saSaJ8xTacR6yAF4XdSc80G7iq05DnRWy/gljOr/Uc14MaUricxWW2K7F8GB2pd4y0pqxIr4rFgDTQ5G0gocGHGITkuteN75C4TLCjuWs2VCcdP5KCVh6le+K7lNZ/T44KHMEWLLC0DfKAcc/blxMnY0Uk/PuJI6BF5adK4wRfZLobTGrSW7cF+n8pfzVNWaEMFQgGy2JlsBoOSA/gfD8ciJOP7J07vThyQtefJ+hgJVWO6hLUSyhaqXtj9jcSx8eTXt2SGk/sQ+ku7jr1p1WneyCoulWILbo31htBi/CwcqZns3bpE2MYNGhfknWT07YYbsYMA6gfzdTOn8BvjaJg5u6lOWr8hnX4SWNHCCJLAzdJXy+i0n648p+V48yHXqeYKUkXqrqdqRyYLJEYkMAA5+ZbkWCa0XCKdmaBu74+ukNQUFtABzRyiw7QJoCtMfglZkuk3j/K0aMuPSdaMzl9+KWM+SyjUaZ+FijpA5vUJh9lsaMQniE+Qa0= alemeji@MEJIA"
repository_config_momg-labs = "https://api.github.com/repos/momggit/terraform_momg-labs"
token_github_config_momg-labs = ""

region  = "us-west-2" #Oregon
zone_id = "Z053490731MKA8J6JB6L7"
domain_lab = "momg-labs.ca"

#vpc
azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

create_lb = true
create_bastion = false
create_proxy = false
create_db = false
create_splunk = false

number_of_instances_bastion = 0
number_of_instances_proxy = 0
number_of_instances_db  = 0
number_of_instances_web = 0
number_of_instances_splunk  = 0

target_group_splunk_path = "/"
target_group_splunk_port = 8000
target_group_splunk_matcher = "303"

target_group_web_path = "/wp-admin"
target_group_web_port = 80
target_group_web_matcher = "301-302"

target_group_db_path = "/"
target_group_db_port = 8080
target_group_db_matcher = "200"

s3_bucket_alb = "s3.alb-momg-labs.ca"
lb_name       = "momg-alb"

#Splunk
instance_type_splunk = "t3.small"
EC2_SPLUNK_VOLUME_SIZE = 1000
EC2_SPLUNK_VOLUME_TYPE = "gp2"
EC2_SPLUNK_VOLUME_DELETE_ON_TERMINATION = true

