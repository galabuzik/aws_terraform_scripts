resource "aws_autoscaling_group" "batchprocess_server" {
  availability_zones        = ["us-east-2a"]
  name                      = "batchprocess_server_asg"
  max_size                  = 4
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
  
  launch_template {
    id      = aws_launch_template.batchprocess_servers.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_schedule" "batchprocess_server_autoscaling_schedule" {
  scheduled_action_name  = "batchprocess_server_autoscaling_schedule"
  min_size               = 0
  max_size               = 4
  desired_capacity       = 0
  start_time             = "2022-04-20T18:00:00Z"
  end_time               = "2022-04-22T06:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.batchprocess_server.name
}

resource "aws_launch_template" "batchprocess_servers" {
  name_prefix   = "batchprocess_servers"
  image_id      = "ami-0c096ca5a3fbca310"
  instance_type = "t2.micro"
}
