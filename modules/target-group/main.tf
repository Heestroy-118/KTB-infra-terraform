resource "aws_lb_target_group" "this" {
  name     = "${var.name}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-tg"
    }
  )
}