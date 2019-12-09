variable "aws_region" {}
variable "aws_profile" {}


variable "cidrs" {
  type = "map"
}

variable "vpc_ip" {}
variable "image_id" {}
variable "capacity" {
  default = 3
}

variable "db_instance_class" {}
variable "dbname" {} 
variable "dbuser" {}
variable "dbpassword" {}
variable "storagetype" {}
variable "storagesize" {}
