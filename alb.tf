resource "aws_lb_target_group" "tg" {
  name     = "${var.ENV}-${var.COMPONENT}"
  port     = var.APP_PORT
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.VPC_ID
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 5
    path                = "/"
    port                = var.APP_PORT
    timeout             = 3
  }
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = var.LB_TYPE == "public" ? data.terraform_remote_state.alb.outputs.PUBLIC_LB_ARN : data.terraform_remote_state.alb.outputs.PRIVATE_LB_ARN
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}