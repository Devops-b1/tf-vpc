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

/*
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
*/

# EC2 Instance Public IP with TOSET
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value = aws_instance.shiv.*.public_ip   # Legacy Splat
  #value = aws_instance.shiv[*].public_ip  # Latest Splat
  value = toset([
      for shiv in aws_instance.shiv : shiv.public_ip
    ])  
}

# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.shiv[*].public_dns  # Legacy Splat
  #value = aws_instance.shiv[*].public_dns  # Latest Splat
  value = toset([
      for shiv in aws_instance.shiv : shiv.public_dns
    ])    
}


# EC2 Instance Public DNS with MAPS
output "instance_publicdns2" {
  value = tomap({
    for s,shiv in aws_instance.shiv : s => shiv.public_dns
    # S intends to be a subnet ID
  })
}