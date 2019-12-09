#------------ SUbnet public ------------

resource "aws_subnet" "MBAterraformS1" {
  vpc_id     = "${aws_vpc.MBAterraformVPC.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1a"
  tags = {
    Name = "MBAterraform_Subnet_Public"
  }
}

resource "aws_route_table_association" "associatepublic" {
  subnet_id      = "${aws_subnet.MBAterraformS1.id}"
  route_table_id = "${aws_route_table.MBAterraformRT1.id}"
}





resource "aws_subnet" "MBAterraformS3" {
  vpc_id     = "${aws_vpc.MBAterraformVPC.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1c"
  tags = {
    Name = "MBAterraform_Subnet_Public2"
  }
}

resource "aws_route_table_association" "associatepublic2" {
  subnet_id      = "${aws_subnet.MBAterraformS3.id}"
  route_table_id = "${aws_route_table.MBAterraformRT1.id}"
}



# ------------ SUBNET private -------------------

resource "aws_subnet" "terraformprivate" {
  vpc_id     = "${aws_vpc.MBAterraformVPC.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-north-1b"
  tags = {
    Name = "MBAterraform_Subnet_Private"
  }
}
resource "aws_route_table_association" "associateprivate" {
  subnet_id      = "${aws_subnet.terraformprivate.id}"
  route_table_id = "${aws_default_route_table.MBAterraformRT2.id}"
}

resource "aws_subnet" "terraformprivate2" {
  vpc_id     = "${aws_vpc.MBAterraformVPC.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-north-1c"
  tags = {
    Name = "MBAterraform_Subnet_Private2"
  }
}
resource "aws_route_table_association" "associateprivate1" {
  subnet_id      = "${aws_subnet.terraformprivate2.id}"
  route_table_id = "${aws_default_route_table.MBAterraformRT2.id}"
}


