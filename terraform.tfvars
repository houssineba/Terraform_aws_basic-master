aws_profile = "MBAterraform"
aws_region  = "eu-north-1"
vpc_ip = "10.0.0.0/16"
cidrs = {
  public1 = "10.0.1.0/24"
  public2 = "10.0.2.0/24"
}
image_id = "ami-7dd85203"
db_instance_class = "db.t3.micro"
dbname = "MBAterraformTEST"
dbuser = "mahmoud"
dbpassword = "benahmed"
storagetype = "gp2"
storagesize = "10" 
