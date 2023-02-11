resource "aws_instance" "instanace1" {
  
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "open"

  tags = {
    name = "newEC2"
  }
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "key-pair" {
  key_name   = "open"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}

