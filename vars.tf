#variable "cidr" {
#    type = list
#    default = ["10.0.0.0/16","10.0.16.0/20","10.0.32.0/20","10.0.48.0/20","10.0.64.0/20"]
#}
#
#variable "tags" {
#    type = map
#    default = {
#        "Name" = "my-Vpc-1"
#        "Env" = "dev"
#    }
#}
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