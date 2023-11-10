
variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "AWS region"

}

variable "amis" {
  type = map(any)
  default = {
    ap-southeast-1 = "ami-078c1149d8ad719a7"
  }
  description = "ANI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance type"
}

variable "public_key" {
  type        = string
  default     = "id_rsa.pub"
  description = "SSH public key"
}

variable "security_group" {
  type        = string
  description = "security group ID"
  default= "sg-09fb6efeb494f745b"
}
