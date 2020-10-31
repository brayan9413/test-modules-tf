# The output that i want to show at the end of command, to avoid go to console
output "instance_ip" {
  value = aws_instance.brayan-instance.*.public_ip
}
