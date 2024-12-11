resource "aws_s3_bucket" "mybucket" {
  bucket = "myarchitecturebucket2024-1"
}

resource "aws_s3_bucket_ownership_controls" "ownershipctrls" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownershipctrls]
  bucket     = aws_s3_bucket.mybucket.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

