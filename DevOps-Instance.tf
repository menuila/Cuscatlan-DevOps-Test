# Public Development Key
resource "aws_key_pair" "DevOps-Key" {
  key_name   = "DevOps-Key"
  public_key = file(var.DEVOPS_PUBLIC_KEY)
}

# Create Development Cluster
resource "aws_instance" "DevOps-Instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  tags          = {
    Name        = "DevOps-Instance"
  }
  # the VPC subnet
  subnet_id = aws_subnet.public-DevOps-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.DevOps-Key.key_name

  # Provision and intall K8
  provisioner "file" {
    source      = "/root/Terraform/DevOps/Install-DevOps-Instance.sh"
    destination = "/tmp/Install-DevOps-Instance.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/Install-DevOps-Instance.sh",
      "sudo sed -i -e 's/\r$//' /tmp/Install-DevOps-Instance.sh",  # Remove the spurious CR characters.
      "sudo /tmp/Install-DevOps-Instance.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.DEVOPS_PRIVATE_KEY)
  }
}