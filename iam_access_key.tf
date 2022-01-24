resource "aws_iam_access_key" "nsamba_robert_key" {
  user    = aws_iam_user.nsamba_robert.name
  pgp_key = "keybase:kelvingalabuzi"
}

resource "aws_iam_user" "nsamba_robert" {
  name = "nsamba.robert"
  path = "/"
}

resource "aws_iam_user_policy" "ec2_policy" {
  name = "ec2_policy"
  user = aws_iam_user.nsamba_robert.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "Access_key_id" {
  value = aws_iam_access_key.nsamba_robert_key.id
}


output "Access_key_secret" {
  value = aws_iam_access_key.nsamba_robert_key.encrypted_secret
}