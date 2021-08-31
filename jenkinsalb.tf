resource "aws_lb" "testing" {
  name               = "hari-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = ["${aws_subnet.hari-subnet.id}", "${aws_subnet.hari-subnet2.id}"]

  enable_deletion_protection = true


  tags = {
    Environment = "stg"
  }
}

resource "aws_lb_target_group" "jenkins-alb-hari" {
  name     = "jenkins-alb-hari-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   =  aws_vpc.Default.id
}



resource "aws_lb_target_group_attachment" "jenkins-alb-hari" {
  target_group_arn = aws_lb_target_group.jenkins-alb-hari.arn
  target_id        = aws_instance.jenkins-hari.id
  port             = 8080
}





# listner


resource "aws_lb_listener" "rnr_end" {
  load_balancer_arn = aws_lb.jenkins-alb-hari.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins-alb-hari.arn
  }
}