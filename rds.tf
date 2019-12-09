# -------- db subnet groupe name ---------

resource "aws_db_subnet_group" "dbsubnet" {
  name       = "mbaterraform_db_subnet_group"
  subnet_ids = ["${aws_subnet.terraformprivate.id}", "${aws_subnet.terraformprivate2.id}"]
  tags = {
    Name = "My DB subnet group"
  }
}

# ----------- RDS -----------

resource "aws_db_instance" "MBAterraformDB" {
  engine = "mysql"
  engine_version = "5.7.26"
  instance_class = "${var.db_instance_class}"
  storage_type = "${var.storagetype}"
  allocated_storage = "${var.storagesize}"
  name = "${var.dbname}"
  username = "${var.dbuser}" 
  password = "${var.dbpassword}"
  db_subnet_group_name = "${aws_db_subnet_group.dbsubnet.id}"
  vpc_security_group_ids = ["${aws_security_group.MBAterraformSG2.id}"]
  multi_az = true
  skip_final_snapshot = true
}
