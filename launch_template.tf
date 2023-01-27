resource "aws_launch_template" "web" {
  name                   = "web"
  image_id               = data.aws_ami.centos7_ami.id
  instance_type          = "t2.micro"
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]

  user_data = filebase64("user_data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = var.common_tags
  }
}