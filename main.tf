resource "aws_instance" "docker_server" {
  ami = data.aws_ami.most_recent_amazon_linux_ami.id
  instance_type = "t2.micro"
  key_name = "MY-Ca-KeyPair"
  associate_public_ip_address = true
  user_data = file("entry_script.sh")

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("private-Key.pem")
  }

  provisioner "file" {
    source = "Dockerfile"
    destination = "/home/ec2-user/Dockerfile"
  }

  tags = {
    Name = "docker_tf_server"
  }
}

data "aws_ami" "most_recent_amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

