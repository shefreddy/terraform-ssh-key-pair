# Generate a new RSA key pair
resource "tls_private_key" "w2key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS EC2 key pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "my-key-pair-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  public_key = tls_private_key.w2key.public_key_openssh

  lifecycle {
    ignore_changes = [key_name]
  }
}

# Save the private key to a local file
resource "local_file" "private_key" {
  content  = tls_private_key.w2key.private_key_pem
  filename = "${path.module}/keyw2.pem"
  file_permission = "0400" # Restrict permissions to owner read-only
}

# Create AWS Lightsail key pair
resource "aws_lightsail_key_pair" "lightsail_key" {
  provider = aws.lightsail
  
  name       = "my-lightsail-key-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  public_key = tls_private_key.w2key.public_key_openssh

  lifecycle {
    ignore_changes = [name]
  }
}