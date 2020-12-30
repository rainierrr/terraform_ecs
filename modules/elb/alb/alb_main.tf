resource "aws_lb" "this" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "this" {
  name        = var.lb_target_group_name
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.internship_vpc
  health_check {
    timeout  = 25
    interval = 40
  }
}


resource "aws_lb_listener" "this" {
  depends_on        = [aws_lb.this, aws_lb_target_group.this]
  load_balancer_arn = aws_lb.this.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}


