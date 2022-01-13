resource "aws_lb_target_group" "first-target" {
  target_type = "instance"
  protocol    = "HTTP"
  port        = "80"
  vpc_id      = aws_vpc.Demo_VPC.id
  tags = {
    Name = "first-target"
  }
}

resource "aws_lb_target_group_attachment" "instance-attach" {
  count            = length(aws_instance.instances)
  target_group_arn = aws_lb_target_group.first-target.arn
  target_id        = aws_instance.instances[0].id
}