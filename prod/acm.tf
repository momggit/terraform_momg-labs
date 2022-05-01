module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name  = var.domain_lab
  zone_id      = "${var.zone_id}"

  subject_alternative_names = [
    "${var.domain_lab}",
    "*.${var.domain_lab}",
  ]

  wait_for_validation = true

  # validate_certificate = false
  # create_certificate = false

  tags = {
    Name = "${var.domain_lab}"
  }
}
