resource "aws_sfn_state_machine" "sfn" {
  name     = "${var.env}-sfn"
  role_arn = "${aws_iam_role.sfn.arn}"

  definition = <<EOT
{
  "Comment": "A Hello World example of the Amazon States Language using an AWS Lambda Function",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda.arn}",
      "End": true
    }
  }
}
EOT
}
