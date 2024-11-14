resource "aws_launch_template" "app" {
  name_prefix   = "app-template"
  image_id      = "ami-042e8287309f5df03" # Ubuntu 20.04 LTS(us-east-1)
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.private_subnet_1.id
    security_groups             = [aws_security_group.app_sg.id]
  }

  tags = {
    Name = "${var.APP_NAME}-${var.module_name}-instance"
  }
}
