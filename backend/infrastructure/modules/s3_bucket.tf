resource "aws_s3_bucket" "s3_bucket" {
  bucket = "emoard"
  versioning {
    enabled = true
  }
}
