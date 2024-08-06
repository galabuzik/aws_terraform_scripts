resource "aws_iam_user_group_membership" "IT_Membership" {
 user = aws_iam_user.matovu.name

 groups = [
   aws_iam_group.IT.name
 ]
}

resource "aws_iam_user" "matovu" {
 name = "matovu.peter"
}

resource "aws_iam_group" "IT" {
  name = "IT-Department"
}
