//variable "cidr" {
//    type = list
//    
//}
//
//variable "tags" {
//    type = map
//    
//}
#
#variable "public_ip" {
#    type = bool
#    default = true
#
#}

variable "instance_type_list" {
  description = "EC2 Instnace Type"
  type = list(string)
  default = ["t2.micro", "t2.small"]
}


variable "instance_type_map" {
  description = "EC2 Instnace Type Map"
  type = map(string)
  default = {
    shiv = "t2.small"
    roshan = "t2.micro"
    stuti = "t2.medium"
  }
}