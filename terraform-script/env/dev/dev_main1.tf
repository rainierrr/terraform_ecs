module "efs1" {
  source                     = "../../modules/efs"
  creation_token             = "efs-dev1"
  security_groups            = [aws_security_group.nfs.id] #変更
  subnet1_id                 = aws_subnet.internship_private1.id
  subnet2_id                 = aws_subnet.internship_private2.id
  efs_file_system_tags_name  = "redmine-dev-efs"
  efs_access_point_tags_name = "for-dev-sqlite"
}


module "ecs1" {
  source                = "../../modules/ecs/task_definition"
  family                = "redmine-dev1"
  container_definitions = file("./task_definition/redmine_dev1_v1.json")
  #container_definitions = file("./task_definition/redmine_dev1_v2.json")
  account_id      = data.aws_caller_identity.self.account_id
  cpu             = 256
  memory          = 512
  file_system_id  = module.efs1.efs_file_system_id
  access_point_id = module.efs1.efs_access_point_id
  volume_name     = "redmine-dev-efs"
}


output "task_definition_arn1" {
  value = module.ecs1.task_definition_arn
}


module "alb1" {
  source               = "../../modules/elb/alb"
  lb_name              = "alb-redmine-dev1"
  lb_target_group_name = "alb-redmine-dev1"
  subnets              = [aws_subnet.internship_private1.id, aws_subnet.internship_private2.id]
  internship_vpc       = aws_vpc.main-vpc.id          #変更
  security_groups      = [aws_security_group.http.id] #変更
}




module "service1" {
  depends_on       = [module.alb1] #aws_lb_listenerの起動をまつ
  source           = "../../modules/ecs/service"
  name             = "internship-redmine-dev1"
  cluster_id       = var.cluster_id
  task_definition  = module.ecs1.task_definition_arn
  desired_count    = 2
  subnets          = [aws_subnet.internship_private1.id, aws_subnet.internship_private2.id]
  security_groups  = [aws_security_group.http.id] #変更
  target_group_arn = module.alb1.target_group_arn
  container_name   = "redmine-dev1" #task_definition/*.jsonで定義するコンテナのname
}




output "alb1_dns_name" {
  value = module.alb1.alb_dns_name
}
/*
resource "aws_instance" "main" {
  ami           = "ami-01b03bedfcb7b7002"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.this.key_name
  subnet_id     = aws_subnet.internship_private1.id

  tags = {
    Name = "rainier-ec2-test"
  }
}

resource "aws_instance" "sub" {
  ami           = "ami-01b03bedfcb7b7002"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.this.key_name
  subnet_id     = aws_subnet.internship_private2.id

  tags = {
    Name = "rainier-ec2-test2"
  }
}
*/
