/*resource "aws_autoscaling_policy" "simple_scaling" {
  name                   = "simple_scaling_policy"
  scaling_adjustment     = 3
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 100
  autoscaling_group_name = aws_autoscaling_group.appserver.name
}

resource "aws_autoscaling_group" "appserver" {
  availability_zones        = ["us-east-2a"]
  name                      = "appserver"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 100
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.appserver.name
}

resource "aws_launch_configuration" "appserver" {
  name_prefix   = "nginxserver_launch_config"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
*/