# ---------- NACL public ---------------
resource "aws_network_acl" "MBAterraformNACL1" {
  vpc_id = "${aws_vpc.MBAterraformVPC.id}"
  subnet_ids = [aws_subnet.MBAterraformS1.id , aws_subnet.MBAterraformS3.id]
  tags = {
    Name = "MBAterraformNACL_Public"
  }
  ingress {
    protocol = "tcp"
    rule_no = 110
    from_port = 22
    to_port = 22
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  ingress {
    protocol = "tcp"
    rule_no = 120
    from_port = 1024
    to_port = 65535
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  ingress {
    protocol = "tcp"
    rule_no = 130
    from_port = 80
    to_port = 80
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  egress {
    protocol = "tcp"
    rule_no = 110
    from_port = 1024
    to_port = 65535
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  egress {
    protocol = "tcp"
    rule_no = 120
    from_port = 22
    to_port = 22
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  egress {
    protocol = "tcp"
    rule_no = 130
    from_port = 80
    to_port = 80
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
  egress {
    protocol = "tcp"
    rule_no = 140
    from_port = 3306
    to_port = 3306
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }
}



# ---------- NACL private ---------------
resource "aws_network_acl" "MBAterraformNACL2" {
  vpc_id = "${aws_vpc.MBAterraformVPC.id}"
  subnet_ids = [aws_subnet.terraformprivate.id]
  tags = {
    Name = "MBAterraformNACL_Private"
  }
  ingress {
    protocol = "tcp"
    rule_no = 110
    from_port = 22
    to_port = 22
 #  cidr_block = "10.0.1.0/24"
    cidr_block = "${var.cidrs["public1"]}"
    action = "allow"
  }
  ingress {
    protocol = "tcp"
    rule_no = 120
    from_port = 3306
    to_port = 3306
    cidr_block = "${var.cidrs["public1"]}"
 #  cidr_block = "10.0.1.0/24"
    action = "allow"
  }
  ingress {
    protocol = "tcp"
    rule_no = 130
    from_port = 22
    to_port = 22
    cidr_block = "${var.cidrs["public2"]}"
    action = "allow"
  }
  ingress {
    protocol = "tcp"
    rule_no = 140
    from_port = 3306
    to_port = 3306
    cidr_block = "${var.cidrs["public2"]}"
    action = "allow"
  }
  egress {
    protocol = "tcp"
    rule_no = 110
    from_port = 1024
    to_port = 65535
    cidr_block = "10.0.1.0/24"
    action = "allow"
  }

}


# -------- SG public -----------
resource "aws_security_group" "MBAterraformSG1" {
  name        = "MBAterraform_SG_Public"
  description = "Allow inbound SSH traffic"
  vpc_id      = "${aws_vpc.MBAterraformVPC.id}"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
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
    Name = "MBAterraform_SG_Public"
  }
}

# -------- SG private -----------
resource "aws_security_group" "MBAterraformSG2" {
  name        = "MBAterraform_SG_Private"
  description = "Allow inbound SSH traffic"
  vpc_id      = "${aws_vpc.MBAterraformVPC.id}"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["10.0.1.0/24"]
  }
  ingress {
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    cidr_blocks = ["10.0.1.0/24"]
  }
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["10.0.2.0/24"]
  }
  ingress {
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    cidr_blocks = ["10.0.2.0/24"]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MBAterraform_SG_Private"
  }
}



