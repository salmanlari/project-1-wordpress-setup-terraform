##s3 ROLE
resource "aws_iam_role" "s3_role" {
  name = "s3_test_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

#S3 POLICY

resource "aws_iam_policy" "iam_policy" {
  name        = "iam_test_policy"
  path        = "/"
  description = "My test policy"
  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_policy_attachment" "iam_attach" {
  name       = "iam_test-attachment"
  roles      = [aws_iam_role.s3_role.name]
  policy_arn = aws_iam_policy.iam_policy.arn
}


#S3 INSTANCE PROFILE
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.s3_role.name
}