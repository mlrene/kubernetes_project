resource "aws_instance" "docker_server" {
  ami = data.aws_ami.most_recent_amazon_linux_ami.id
  instance_type = "t2.medium"
  key_name = "MY-Ca-KeyPair"
  associate_public_ip_address = true
  user_data = file("entry_script.sh")

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  # connection {
  #   type = "ssh"
  #   user = "ec2-user"
  #   host = self.public_ip
  #   private_key = file("private-Key.pem")
  # }

  # provisioner "file" {
  #   source = "Dockerfile"
  #   destination = "/home/ec2-user/Dockerfile"
  # }
  #   provisioner "file" {
  #   source = "oxer-html"
  #   destination = "/home/ec2-user/oxer-html"
  # }

  tags = {
    Name = "minikube_server"
  }
}

data "aws_ami" "most_recent_amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

