resource "aws_iam_user" "mwanjje" {
  name = "mwanjje.joshua"
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  description = "Allow all S3 actions"
  policy      = jsonencode({
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

resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.mwanjje.name
  policy_arn = aws_iam_policy.s3_policy.arn
}