resource "aws_iam_role" "s3_beanstalk" {
  name = "s3_beanstalk"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "s3_beanstalk_policy" {
  name        = "S3_BeanStalk_Policy"
  description = "S3 Access to Elastic BeanStalk"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
        {
            "Effect": "Allow",
            "Action": "elasticbeanstalk:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_beanstalk_policy_attachment" {
  role       = aws_iam_role.s3_beanstalk.name
  policy_arn = aws_iam_policy.s3_beanstalk_policy.arn
}