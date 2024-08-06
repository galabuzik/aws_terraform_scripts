resource "aws_iam_group_policy" "s3_policy" {
  name  = "s3_policy"
  group = aws_iam_group.sys_analysts.name

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

resource "aws_iam_group" "sys_analysts" {
  name = "System-Analysts"
  path = "/"
}