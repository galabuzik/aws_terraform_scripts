resource "aws_iam_user" "nicholas" {
  name          = "nicholas.kapenge"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "nicholas_profile" {
  user    = aws_iam_user.nicholas.name
  pgp_key = "keybase:kelvingalabuzi"
}

output "password" {
  value = aws_iam_user_login_profile.nicholas_profile.encrypted_password
}