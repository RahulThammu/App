resource "aws_alb" "alb" {  
  name            = "${var.env}-alb"  
  subnets         = "${aws_subnet.public-subnet.*.id}"
  security_groups = ["${aws_security_group.sg-alb.id}"]
}

resource "aws_alb_target_group" "alb_target_group" {  

  name     = "${var.env}-al-tg"  
  port     = "${var.ec2_ports}"
  protocol = "HTTP"  
  vpc_id   = aws_vpc.vpc.id    
   
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10   
    protocol            = "HTTP" 
    path                = "/"
    port                = "traffic-port"
  }
}


resource "aws_alb_listener" "alb_listener" {  

  load_balancer_arn = "${aws_alb.alb.arn}"  
   port              = "80"
    protocol          = "HTTP"
    #ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    #certificate_arn  = aws_acm_certificate_validation.hello_cert_validate.certificate_arn
 
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"  
  }

  #depends_on = [aws_acm_certificate.hello_certificate]
}