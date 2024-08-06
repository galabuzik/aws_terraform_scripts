module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  
  
  image_id        = "ami-0c096ca5a3fbca310"
  instance_type   = "t2.micro"
  
  
  name               = "webservers-asg"
  health_check_type  = "EC2"
  availability_zones = ["us-east-2a"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1
  }
