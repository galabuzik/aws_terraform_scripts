resource "aws_iam_group" "clouddevs" {
  name = "Cloud-Developers"
}

resource "aws_iam_policy" "clouddevs_s3_policy" {
  name        = "clouddevs_s3_policy"
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

resource "aws_iam_group_policy_attachment" "s3_policy_attachment" {
  group      = aws_iam_group.clouddevs.name
  policy_arn = aws_iam_policy.s3_policy.arn
}