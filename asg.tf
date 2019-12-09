# ---------- launch configuration -----------

resource "aws_launch_configuration" "MBAterraformLC" {
  name = "MBAterraformLC"
  image_id = "${var.image_id}"
  instance_type = "t3.micro"
  key_name = "MBA"
  security_groups = [aws_security_group.MBAterraformSG1.id]
  associate_public_ip_address = "true"
  
  lifecycle {
    create_before_destroy = "true"
  }
    user_data = "${file("install_httpd.sh")}"
}

# ---------- ASG -----------

resource "aws_autoscaling_group" "MBAterraformASG" {
  name = "MBAterraformASG"
  launch_configuration = aws_launch_configuration.MBAterraformLC.name
  max_size = 5
  min_size = 2
  vpc_zone_identifier = ["${aws_subnet.MBAterraformS1.id}" , "${aws_subnet.MBAterraformS3.id}" ]
  desired_capacity = "${var.capacity}"
  load_balancers = [aws_elb.MBAterraformCLB.name]
  health_check_type = "ELB"
}
