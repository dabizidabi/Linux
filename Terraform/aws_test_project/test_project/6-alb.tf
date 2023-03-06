locals {
  create_lb = var.create_lb && var.putin_khuylo
}

resource "aws_security_group" "allow-http" {
  name = "allow-http"
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.allow-http.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_lb" "front_end" {
  count              = local.create_lb ? 1 : 0
  name               = "front-end"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow-http.id]
  subnets            = [for subnet in aws_subnet.public-subnets : subnet.id]

  enable_deletion_protection = true

  tags = {
    Name = "alb-test"
  }
}

resource "aws_lb_target_group" "main" {
  name        = "main-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.main.id

  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "front_end" {
  count             = local.create_lb ? 1 : 0
  load_balancer_arn = aws_lb.front_end[count.index].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2_tg_attachment" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.ec2.id
}



####################################################################
variable "create_lb" {
  description = "Controls if the Load Balancer should be created"
  type        = bool
  default     = true
}

variable "putin_khuylo" {
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}
