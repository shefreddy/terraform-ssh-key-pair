output "ec2_key_name" {
    value = aws_key_pair.ec2_key.key_name
  
}

output "lightsail_key_name" {
    value = aws_lightsail_key_pair.lightsail_key.name
  
}

output "private_key_saved_to" {
    value = local_file.private_key.filename
  
} 