resource "aws_iam_user_policy" "s3_policy" {
  name = "s3_policy"
  user = aws_iam_user.linda.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "linda" {
  name = "linda.lillian"
  path = "/"
}

resource "aws_iam_access_key" "linda_key" {
  user = aws_iam_user.linda.name
}