# EFSファイルシステム =============================================
resource "aws_efs_file_system" "this" {
  creation_token = var.creation_token
  encrypted      = true
  tags = {
    Name = var.efs_file_system_tags_name
  }
}

resource "aws_efs_access_point" "this" {
  file_system_id = aws_efs_file_system.this.id
  root_directory {
    path = "/sqlite"
    creation_info {
      owner_gid   = 999
      owner_uid   = 999
      permissions = 0755
    }
  }
  tags = {
    Name = var.efs_access_point_tags_name
  }
}

resource "aws_efs_mount_target" "subnet1" {
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet1_id
  security_groups = var.security_groups
}

resource "aws_efs_mount_target" "subnet2" {
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet2_id
  security_groups = var.security_groups
}
