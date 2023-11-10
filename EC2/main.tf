/*
*创建aws EC2 实例
*允许通过ssh 登录 
*/

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami           = "ami-078c1149d8ad719a7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh.key_name
}

#添加ssh 登录密钥 
resource "aws_key_pair" "ssh" {
  key_name   = "aws-tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCt80V7A0SnwfwapfI13MD2FnyxvUlZGvxa4ZDeCCMjLQr4sAFYJ/hN/5aoI+9vMubWsjDABK9KO35Hw1PQxmfnQ0EuNdv4SyFTjkqQCwSKXiN8/lff6EsrD3Y6XYJlLOtvdWnXXlJugljgoJQdDxm1jPYiGVCnMLkFMwYn9N9BESiz1RF8XpPJJKee8ORpPuIdL9jFCCrZxVh8hzOmlJ3UE5ExHhMie1phA8qEWGDFks4Q+wcODVnak2LBdYCXEshP5QEbsIqcOTrp8xiNWWbOg+6UK7yCfQzagXTPC9mIgt6Dl8jUWKFaq/IjKAJnwiyXAcWpVdswyQ3pbeLZQNE7/u/E4+IzqifhZYyZbHze1TZ5OGMEccYMHzQJ6HDhPQO1LKfWKI+PjELQEsJNwMNstClzHhO3fbGRb7GAQEeiKaEiputm/ft2+LvKe21rPnILr3TgIjiIAVJy58WMzZe1H8AT/b1yXGm5eua6HssMqM3zWoHwytJ8pTqIZ5GHaCE= djmails@163.com"
}

# 开放22 端口
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-09fb6efeb494f745b"
}