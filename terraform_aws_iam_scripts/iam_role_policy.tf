resource "aws_iam_role" "lambda-beanstalk" {
  name = "lambda-beanstalk"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_role_policy" "elasticbeanstalk_policy" {
  name = "elasticbeanstalk_policy"
  role = aws_iam_role.lambda-beanstalk.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            "Effect": "Allow",
            "Action": "elasticbeanstalk:*",
            "Resource": "*"
        }
    ]
  })
}