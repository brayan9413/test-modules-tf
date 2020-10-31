# Instance
variable "ami_id" {
  # default value if declaration not exist
  default     = ""
  description = "ami id"
}
variable "instance_type" {
  default     = ""
  description = "instance type"
}
variable "tags" {
  default     = ""
  description = "tags for instance"
}
# Security group
variable "sg_name" {
  default     = ""
  description = "security group name"
}
variable "ingress_rules" {
  default     = ""
  description = "ingress_rules for security group"
}
