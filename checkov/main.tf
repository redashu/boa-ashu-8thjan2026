provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "bad_bucket" {
    bucket = "my-insecure-bucket-demo"
    acl    = "public-read"
}
resource "aws_iam_policy" "bad_policy" {
    name = "bad-policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect   = "Allow"
            Action   = "*"
            Resource = "*"
        }]
    })
}
resource "aws_security_group" "bad_sg" {
    name = "open-sg"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}