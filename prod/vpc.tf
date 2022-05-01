#https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
#https://registry.terraform.io/namespaces/antonbabenko
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.project_name
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_igw                    = true
  public_dedicated_network_acl  = true
  private_dedicated_network_acl = true
  enable_dns_hostnames          = true

  single_nat_gateway = false
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }

  # default_network_acl_ingress = [
  #     { "action": "allow",
  #      "cidr_block": "0.0.0.0/0",
  #       "from_port": 0, "protocol": "-1",
  #        "rule_no": 100, "to_port": 0
  #     },
  #     { "action": "allow", "from_port": 0,
  #      "ipv6_cidr_block": "::/0", "protocol": "-1",
  #       "rule_no": 101, "to_port": 0
  #     }
  # ]
}
