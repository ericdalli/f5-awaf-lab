output "vpc_id" {
  value = aws_vpc.lab.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_subnet_cidr" {
  value = aws_subnet.public.cidr_block
}
output "sg_bigip_mgmt_id" { value = aws_security_group.bigip_mgmt.id }
output "sg_bigip_app_id" { value = aws_security_group.bigip_app.id }
output "sg_backend_id" { value = aws_security_group.backend.id }
