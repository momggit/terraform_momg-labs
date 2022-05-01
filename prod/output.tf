output "vpc_id" {
  value = module.vpc.vpc_id
}

# output "acm_certificate_arn" {
#   value = module.acm.acm_certificate_arn
# }

# output "target_group_splunk" {
#   value = aws_lb_target_group.target_group_splunk.id
# }

# output "target_group_db"{
#   value = aws_lb_target_group.target_group_db.id
# }

# output "target_group_web"{
#   value = aws_lb_target_group.target_group_web.id
# }

# output "user-data-db-rendered" {
#   value = [data.template_file.user-data-db.*.rendered]
# }

# output "user-data-proxy-rendered" {
#   value = "${data.template_file.user-data-proxy.rendered}"
# }

# output "user-data-web-rendered" {
#   value = "${data.template_file.user-data-web.*.rendered}"
# }

# output "user-data-bastion-rendered"{
#   value = "${data.template_file.user-data-bastion.rendered}"
# }

# output "user-data-splunk-rendered"{
#   value = "${data.template_file.user-data-splunk.*.rendered}"
# }

output "splunk-private_ip" {
  value = [data.aws_instance.splunk.*.private_ip]
}

output "splunk-public_ip"{
  value = [data.aws_instance.splunk.*.public_ip]
}

output "proxy-private_ip" {
  value = [data.aws_instance.proxy.*.private_ip]
}

output "bastion_ip_public" {
  value = data.aws_instance.bastion.*.public_ip
}

# output "comando_ssh_bastion"{
#   value = "ssh ubuntu@${tostring([data.aws_instance.bastion.*.public_ip])} -A"
# }
