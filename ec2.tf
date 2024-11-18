resource "aws_instance" "batch_ec2" {
  ami = "ami-042e8287309f5df03"
  instance_type = "t2.micro"             # 원하는 EC2 인스턴스 타입
  subnet_id = aws_subnet.private_subnet_1.id # 퍼블릭 서브넷 연결

  # EC2에 연결할 보안 그룹
  vpc_security_group_ids = [
    aws_security_group.app_sg.id, # EC2용 보안 그룹
  ]

  # 태그 추가
  tags = {
    Name        = "batch_ec2-instance"
    Environment = var.Environment
  }
}

resource "aws_instance" "service_ec2" {
  ami = "ami-042e8287309f5df03"
  instance_type = "t2.micro"             # 원하는 EC2 인스턴스 타입
  subnet_id = aws_subnet.private_subnet_1.id # 퍼블릭 서브넷 연결

  # EC2에 연결할 보안 그룹
  vpc_security_group_ids = [
    aws_security_group.app_sg.id, # EC2용 보안 그룹
  ]

  # 태그 추가
  tags = {
    Name        = "service_ec2-instance"
    Environment = var.Environment
  }
}

