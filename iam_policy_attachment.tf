resource "aws_iam_user" "victor" {
  name = "victor.manuel"
}

resource "aws_iam_role" "msp_access" {
  name = "msp_access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_group" "Developer_Support" {
  name = "Developer_Support"
}

resource "aws_iam_policy" "elasticbeanstalk_policy" {
  name        = "Developer_Support_BeanStalk_FullAccess"
  description = "Full Access to Elastic BeanStalk Environments"

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

resource "aws_iam_policy_attachment" "elasticbeanstalk_policy_attachment" {
  name       = "elasticbeanstalk_policy_attachment"
  users      = [aws_iam_user.victor.name]
  roles      = [aws_iam_role.msp_access.name]
  groups     = [aws_iam_group.Developer_Support.name]
  policy_arn = aws_iam_policy.elasticbeanstalk_policy.arn
}