resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_web_instances.name
}

resource "aws_iam_role" "ec2_web_instances" {
  name = "ec2_web_instances"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
 
}
 
resource "aws_iam_policy" "ec2_instance_profile_policy" {
  name   = "ec2_instance_profile_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_policy_document.json
}

resource "aws_iam_policy_attachment" "ec2_instance_profile_attachment" {
  name       = "ec2_instance_profile_attachment"
  roles      = [aws_iam_role.ec2_web_instances.name]
  policy_arn = aws_iam_policy.ec2_instance_profile_policy.arn
}
