resource "aws_ecs_service" "this" {
  name             = var.name
  cluster          = var.cluster_id
  task_definition  = var.task_definition
  desired_count    = var.desired_count
  platform_version = "1.4.0"
  launch_type      = "FARGATE"

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = 3000
  }
}
