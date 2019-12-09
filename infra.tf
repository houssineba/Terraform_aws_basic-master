# --------- VPC ------------
resource "aws_vpc" "MBAterraformVPC" {
  cidr_block = "${var.vpc_ip}"
  tags = {
    Name = "MBAterraformVPC"
  }

}

# --------- INTERNET GATEWAY -------------
resource "aws_internet_gateway" "MBAterraformGW" {
  vpc_id = "${aws_vpc.MBAterraformVPC.id}"
  tags = {
    Name = "MBAterraformGW"
  }
}

# ---------- ROUTE TABLES ---------------
resource "aws_route_table" "MBAterraformRT1" {
  vpc_id = "${aws_vpc.MBAterraformVPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.MBAterraformGW.id}" 
  }
  tags = {
    Name = "MBAterraformRT_Public"
  }
}
    
resource "aws_default_route_table" "MBAterraformRT2" {
  default_route_table_id = "${aws_vpc.MBAterraformVPC.default_route_table_id}"
  tags = {
    Name = "MBAterraformRT_private"
  }
}




