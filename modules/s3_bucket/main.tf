resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${var.env}"

  tags = {
    Name        = "${var.bucket_name}-${var.env}"
    Environment = var.env
  }
}