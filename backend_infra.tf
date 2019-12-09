# ------- S3 --------
# used to save the state file

resource "aws_kms_key" "MBAtest" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}


resource "aws_s3_bucket" "MBAterraform_state1" {
  bucket = "mbaterraformstate"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.MBAtest.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
}
}

# ----- DynamoDB ----------
# used to lock the file

resource "aws_dynamodb_table" "MBAterraform_lock" {
  name = "mbaterraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"   
   # ca doit etre exactement "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }   
}

