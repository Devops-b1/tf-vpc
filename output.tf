output "public_ip" {
    value = aws_instance.shiv.public_ip

}

output "public_dns" {
    value = aws_instance.shiv.public_dns
    
}

output "private_ip" {
    value = aws_instance.shiv.private_ip
    
}