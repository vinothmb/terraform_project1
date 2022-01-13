resource "aws_lb" "Demo-elb" {
  name               = "app-lb"
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.public-sg.id}"]
  subnets            = var.subnet

  tags = {
    Name = "Demo-elb"
  }

}

resource "aws_alb_listener" "listener-port" {
  load_balancer_arn = aws_lb.Demo-elb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.first-target.arn
  }
}