resource "aws_s3_bucket" "admin-dev" {
  // Ourr bucket's name is going to be the same as our site's domain name.
  bucket = "${var.bucketName}"
}

/* resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.admin-dev.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.admin-dev.arn,
      "${aws_s3_bucket.admin-dev.arn}/*",
    ]
  }
} */
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.admin-dev.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.admin-dev.id
  acl    = "private"
}
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.admin-dev.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
