output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}
output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.app_server.private_ip
}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
output "region" {
  value = data.aws_region.current.name
}
output "instance_network_id" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.app_server.subnet_id
}