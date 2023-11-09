provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "web" {
    ami = "ami-078c1149d8ad719a7"
    instance_type = "t2.micro"
}

