resource "aws_lambda_function" "lambda" {
  filename         = "${path.module}/src/lambda.zip"
  source_code_hash = "${base64sha256(file("${path.module}/src/lambda.zip"))}"
  function_name    = "${var.env}-lambda"
  role             = "${aws_iam_role.lambda.arn}"
  handler          = "handler.hello"
  runtime          = "python2.7"
}
