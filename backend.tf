# ----- terraform backend ----------
# configurer terraform backend to use s3 a la place backend local

terraform {
  backend "s3" {
    bucket = "mbaterraformstate"
    key = "global/s3/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "mbaterraform_lock"
    profile = "MBAterraform"
  }
}
