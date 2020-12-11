module "efs" {
  source                     = "../../modules/efs"
  creation_token             = "product" #固有値 
  security_groups            = [var.security_group_nfs]
  subnet_id                  = var.subnet_internshi_private1_id
  efs_file_system_tags_name  = "redmine02-efs"
  efs_access_point_tags_name = "for_sqlite"

}


module "ecs" {
  source                = "../../modules/ecs/task_definition"
  family                = "redmine02"
  container_definitions = file("./task_definition/redmine02.json")
  account_id            = data.aws_caller_identity.self.account_id
  cpu                   = 256
  memory                = 512
  file_system_id        = module.efs.efs_file_system_id
  access_point_id       = module.efs.efs_access_point_id
  volume_name           = "redmine02-efs"
}

module "alb1" {
  source               = "../../modules/elb/alb"
  lb_name              = "alb-redmine-1"
  lb_target_group_name = "lb-redmine-1"
  subnets              = [aws_subnet.internship_private1.id, aws_subnet.internship_private2.id]
  internship_vpc       = var.internship_vpc
  security_groups      = [var.security_group_http]
}

output "task_definition_arn1" {
  value = module.ecs.task_definition_arn
}
