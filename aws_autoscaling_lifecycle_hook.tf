/*resource "aws_autoscaling_group" "batch_app_server" {
  availability_zones   = ["us-east-2a"]
  name                 = "batch_app_server"
  max_size           = 3
  min_size           = 1
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  launch_template {
    id      = aws_launch_template.batch_app_server.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_lifecycle_hook" "batch_app_server_lifecycle_hook" {
  name                   = "batch_app_server_lifecycle_hook"
  autoscaling_group_name = aws_autoscaling_group.batch_app_server.name
  default_result         = "CONTINUE"
  heartbeat_timeout      = 100
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"
}

resource "aws_launch_template" "batch_app_server" {
  name_prefix   = "batch_app_server"
  image_id      = "ami-0c096ca5a3fbca310"
  instance_type = "t2.micro"
}
*/