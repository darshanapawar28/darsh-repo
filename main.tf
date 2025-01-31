provider "aws" {
  region = "ap-south-1"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = "vpc-06b326e20d7db55f9"  # Provided in exam
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_security_group" "lambda_sg" {
  vpc_id = "vpc-06b326e20d7db55f9"
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "my_lambda_function"
  role            = "arn:aws:iam::123456789012:role/DevOps-Candidate-Lambda-Role"
  handler         = "lambda_function.lambda_handler"
  runtime         = "python3.8"
  filename        = "lambda_function.zip"
  vpc_config {
    subnet_ids         = [aws_subnet.private_subnet.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }
}
