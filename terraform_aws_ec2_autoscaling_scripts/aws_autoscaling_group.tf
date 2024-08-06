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
}
