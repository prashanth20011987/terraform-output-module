variable "AMIS" {
  type        = map(string)
  description = "LIST OF AMIS TO USE IN EACH REGION"
  default = {
    us-east-2  = "ami-03657b56516ab7912"
    ap-south-1 = "ami-013e83f579886baeb"
    us-west-2  = "ami-09021cbd462419e4c"
  }
}
variable "REGION" {
  default = "us-east-2"
}
variable "ZONE1" {
  default = "us-east-2a"

}
variable "USER" {
  default = "ec2-user"
}