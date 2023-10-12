/*
output "public_ip" {
    value = aws_instance.shiv.public_ip

}

output "public_dns" {
    value = aws_instance.shiv.public_dns
    
}

output "private_ip" {
    value = aws_instance.shiv.private_ip
    
}
*/

output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.shiv: instance.public_dns ]
}

output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.shiv: instance.id => instance.public_dns}
}


output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.shiv: c => instance.public_dns}
}