/*data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20220406.1-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_launch_configuration" "nginxserver" {
  name_prefix   = "nginxserver_launch_config"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "nginxserver" {
  name                 = "nginxserver_asg"
  availability_zones = ["us-east-2a"]
  launch_configuration = aws_launch_configuration.nginxserver.name
  min_size             = 1
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}
*/