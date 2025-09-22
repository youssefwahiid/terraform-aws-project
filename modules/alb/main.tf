#########################
# Public ALB (Internet-facing)
#########################
resource "aws_lb" "public" {
  name               = "${var.name}-public"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [var.public_alb_sg_id]

  tags = {
    Name = "${var.name}-public"
  }
}

# Target group for public instances
resource "aws_lb_target_group" "public_tg" {
  name     = "${var.name}-public-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

# Attach EC2s to public target group
resource "aws_lb_target_group_attachment" "public_tg_attach" {
  count            = length(var.public_target_instance_ids)
  target_group_arn = aws_lb_target_group.public_tg.arn
  target_id        = var.public_target_instance_ids[count.index]
  port             = 80
}

# Listener for public ALB
resource "aws_lb_listener" "public_listener" {
  load_balancer_arn = aws_lb.public.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_tg.arn
  }
}

#########################
# Internal ALB (Private)
#########################
resource "aws_lb" "internal" {
  name               = "${var.name}-internal"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.private_subnets
  security_groups    = [var.internal_alb_sg_id]

  tags = {
    Name = "${var.name}-internal"
  }
}

# Target group for internal instances
resource "aws_lb_target_group" "internal_tg" {
  name     = "${var.name}-internal-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

# Attach EC2s to internal target group
resource "aws_lb_target_group_attachment" "internal_tg_attach" {
  count            = length(var.internal_target_instance_ids)
  target_group_arn = aws_lb_target_group.internal_tg.arn
  target_id        = var.internal_target_instance_ids[count.index]
  port             = 80
}

# Listener for internal ALB
resource "aws_lb_listener" "internal_listener" {
  load_balancer_arn = aws_lb.internal.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internal_tg.arn
  }
}
