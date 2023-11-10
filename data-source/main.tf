/*
*创建aws EC2 实例
*允许通过ssh 登录 
*/

provider "aws" {
  region = var.region
}
data "aws_security_groups" "default" {
    filter {
        name = "group-name"
        values  = ["default"]
    }
}

resource "aws_instance" "web" {
  ami           = lookup(var.amis,var.region)
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh.key_name
  user_data = "setup_nginx.sh"
  tags = {
      Name = "nginx-web-server"
  }
}

#添加ssh 登录密钥 
resource "aws_key_pair" "ssh" {
  key_name   = "admin"
  public_key = file(var.public_key)
}

# 开放22 端口
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_groups.default.ids[0]
}

# 开放22 端口
resource "aws_security_group_rule" "web" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_groups.default.ids[0]
}