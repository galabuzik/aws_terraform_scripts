resource "aws_iam_user" "walter" {
  name = "walter.king"
  path = "/"
}

resource "aws_iam_user_ssh_key" "walter_ssh_key" {
  username   = aws_iam_user.walter.name
  encoding   = "SSH"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBz3n69Rbf32ILGsFwpc/N6XH7xgyHWtig6TvrgAuLaJyb53EBUuuG1DirICOXIoBQq1yGtsoVhMQVVBUKp41VbHDaNLcMC3tt+nj5VMv8RE/nLuDkiI+1iJYPgZbKRF1/Qzyei77B5k+BznaRUPqjnJSzSunjvuEqCjcH2fPQjlTT68+apzq0SIhuedXSkd9svrWENjvw37HvDU4MOUshZJyLvKAXAuTZA7yZOSrPkyAfO6o5bBICGjxOCeoQcgphk3u4FvnfD+k7ToHnWj28/LqPWguFywTjzZiZ+pmDJ6CzWuwJ0r8l2VrQJ4uP5QFntkr10PzpTYqe+iB2LPsN"
}