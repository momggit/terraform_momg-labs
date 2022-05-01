resource "aws_efs_file_system" "momg-efs" {
  creation_token = "${var.project_name}-efs"

  tags = {
    Name = "${var.project_name}-efs"
  }

}

resource "aws_efs_mount_target" "efs-mount" {
  # count       = length(data.aws_subnet_ids.selected.ids)
  count          = length(data.aws_subnets.private.ids)
  file_system_id = aws_efs_file_system.momg-efs.id
  # subnet_id       = tolist(data.aws_subnet_ids.selected.ids)[count.index]
  subnet_id = tolist(data.aws_subnets.private.ids)[count.index]
  security_groups = [
    aws_security_group.allow_nfs.id
  ]
}


