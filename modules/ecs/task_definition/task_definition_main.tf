# ECS ==============================================================

resource "aws_ecs_task_definition" "this" {
  family                   = var.family
  container_definitions    = var.container_definitions
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE", "EC2"]

  task_role_arn      = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  #リソース定義
  cpu    = var.cpu
  memory = var.memory

  volume {
    name = var.volume_name
    efs_volume_configuration {
      file_system_id     = var.file_system_id
      transit_encryption = "ENABLED"
      authorization_config {
        access_point_id = var.access_point_id
      }
    }
  }
}



