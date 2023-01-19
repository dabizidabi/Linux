terraform {
  backend "s3" {
    bucket         = "dabizidabi-terrafrom"
    key            = "mngm/iamUser"
    region         = "eu-west-1"
    dynamodb_table = "s3terraformlock"
  }
}

#~~~~~~~~~~~~~~~~ USER ~~~~~~~~~~~~~~~~
#create iam user
resource "aws_iam_user" "my-user" {
  name = var.name
}

#set up user's password
resource "aws_iam_user_login_profile" "my-user" {
  user                    = aws_iam_user.my-user.name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required

  depends_on = [aws_iam_user.my-user]

  lifecycle {
    ignore_changes = [password_reset_required]
  }
}

#~~~~~~~~~~~~~~~~ GROUP ~~~~~~~~~~~~~~~~
#create iam group
resource "aws_iam_group" "admins" {
  name = var.group_name
}

#add policy to group
resource "aws_iam_group_policy" "admins-group-policy" {
  name  = var.aws_iam_group_policy_name
  group = aws_iam_group.admins.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}

#add user to group
resource "aws_iam_group_membership" "admins" {
  name = var.aws_iam_group_membership_name
  users = [
    aws_iam_user.my-user.name,
  ]
  group = aws_iam_group.admins.name
}

