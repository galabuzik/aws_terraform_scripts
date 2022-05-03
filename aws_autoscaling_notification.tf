/*resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = [
    aws_autoscaling_group.webserver_asg.name,
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.webserver_topic.arn
}

resource "aws_sns_topic" "webserver_topic" {
  name = "webserver_topic"
}

resource "aws_autoscaling_group" "webserver_asg" {
  name = "test_webserver_asg"
  availability_zones = ["us-east-2a"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.webserver.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "webserver" {
  name_prefix   = "webserver"
  image_id      = "ami-0c096ca5a3fbca310"
  instance_type = "t2.micro"
}
*/