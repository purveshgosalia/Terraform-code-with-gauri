##ALB

resource "aws_lb" "alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets



  tags = {
    Environment = "production"
  }
}


########Listener


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


############Target Groups

resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


########### Target Group Attachments
resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instance_id)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance_id[count.index]
  port             = 80
}