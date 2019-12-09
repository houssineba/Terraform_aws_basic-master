provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

# au lieu de profile on peu utiliser access_key and secret_key
