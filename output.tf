output "docker_server_Public_ip" {
  value = aws_instance.docker_server.public_ip
}