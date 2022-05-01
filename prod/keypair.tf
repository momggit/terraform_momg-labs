resource "aws_key_pair" "keypair_lab" {
  key_name   = "${var.project_name}-keypair_lab"
  public_key = var.public_key_labs
}

resource "aws_key_pair" "keypair_bastion" {
  key_name = "${var.project_name}-keypair_bastion"
  public_key = var.public_key_bastion
}
