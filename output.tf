#output "vpc_id" {
#  value = aws_vpc.MBAterraformVPC.id
#}
#output "IGW_id" {
#  value = aws_internet_gateway.MBAterraformGW.id
#}
#output "RT_public_subnet" {
#  value = aws_route_table.MBAterraformRT1.id
#}
#output "RT_private_subnet" {
#  value = aws_default_route_table.MBAterraformRT2.id
#}
#output "NACL_public_public" {
#  value = aws_network_acl.MBAterraformNACL1.id
#}
#output "NACL_private_subnet" {
#  value = aws_network_acl.MBAterraformNACL2.id
#}
#output "SG_public_subnet" {
#  value = aws_security_group.MBAterraformSG1.id
#}
#output "SG_private_subnet" {
#  value = aws_security_group.MBAterraformSG2.id
#}
#output "SG_CLB" {
#  value = aws_security_group.MBAterraformSG_CLB.id
#}
#output "Subnet_public1" {
#  value = aws_subnet.MBAterraformS1.id
#}
#output "Subnet_public2" {
#  value = aws_subnet.MBAterraformS3.id
#}
#output "Subnet_private" {
#  value = aws_subnet.terraformprivate.id
#}
#output "launch_configuration" {
#  value = aws_launch_configuration.MBAterraformLC.id
#}
#output "auto_scaling_group" {
#  value = aws_autoscaling_group.MBAterraformASG.id
#}
#output "CLB" {
#  value = aws_elb.MBAterraformCLB.id
#}
#output "instance_private" {
#  value = aws_instance.MBAterraformEC2_2.id
#}

output "s3_id" {
  value = aws_s3_bucket.MBAterraform_state.arn
}

output "dynamodb_table" {
  value = aws_dynamodb_table.MBAterraform_lock.name
}
