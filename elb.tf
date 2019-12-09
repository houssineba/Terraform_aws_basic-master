# --------- CLB --------------

resource "aws_security_group" "MBAterraformSG_CLB" {
  name        = "MBAterraform_SG_CLB"
  description = "Allow inbound http traffic"
  vpc_id      = "${aws_vpc.MBAterraformVPC.id}"
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MBAterraform_SG_CLB"
  }
}



resource "aws_elb" "MBAterraformCLB" {
  name = "MBAterraformCLB"
  subnets = [aws_subnet.MBAterraformS1.id , aws_subnet.MBAterraformS3.id]
  security_groups = [aws_security_group.MBAterraformSG_CLB.id]
  health_check {
    target = "HTTP:80/"
    interval =30
    timeout = 5
    healthy_threshold = 10
    unhealthy_threshold = 3
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = 80
    instance_protocol = "http"
  }
}
