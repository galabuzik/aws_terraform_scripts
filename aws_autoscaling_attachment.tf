resource "aws_autoscaling_attachment" "webservers_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.webservers.id
  elb                    = aws_elb.webservers_loadbalancer.id
}

resource "aws_launch_template" "webservers" {
  name_prefix   = "webservers"
  image_id      = "ami-0c096ca5a3fbca310"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "webservers" {
  availability_zones = ["us-east-2a"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.webservers.id
    version = "$Latest"
  }
  
  depends_on = [
    aws_elb.webservers_loadbalancer
  ]
}

resource "aws_elb" "webservers_loadbalancer" {
  name               = "webservers-loadbalancer"
  availability_zones = ["us-east-2a", "us-east-2b"]


  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

}
