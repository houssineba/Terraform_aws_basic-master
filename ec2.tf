# ------ public ec2 ------------

resource "aws_instance" "MBAterraformEC2_1" {
  ami = "ami-7dd85203"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.MBAterraformSG1.id]
  subnet_id = "${aws_subnet.MBAterraformS1.id}"
  associate_public_ip_address = "true"
  key_name = "MBA"
  tags = {
    Name = "MBAterraform_public"
  }
}

# ------ private ec2 ------------

# resource "aws_instance" "MBAterraformEC2_2" {
#  ami           = "ami-7dd85203"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [aws_security_group.MBAterraformSG2.id]
#  key_name = "MBA"
#  subnet_id = "${aws_subnet.terraformprivate.id}"
#  tags = {
#    Name = "MBAterraform_private"
#  }
#}
