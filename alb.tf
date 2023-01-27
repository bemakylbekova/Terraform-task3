resource "aws_lb_target_group" "tasktg" {
  name     = "tasktg"
  vpc_id   = aws_vpc.main.id
  port     = 80
  protocol = "HTTP"
 
  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.taskalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tasktg.arn
  }
}

resource "aws_lb" "taskalb" {
  name               = "TaskALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http_sg.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]

  tags = var.common_tags
}

