# AWS
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

# Keys
variable "DEVOPS_PRIVATE_KEY" {
  default = "DevOps-Key"
}
variable "DEVOPS_PUBLIC_KEY" {
  default = "DevOps-Key.pub"
}

# Images
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0070c5311b7677678"
    us-east-2 = "ami-07f84a50d2dec2fa4"
    us-west-1 = "ami-040a251ee9d7d1a9b"
    us-west-2 = "ami-0aab355e1bfa1e72e"
  }
}

# Username
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}