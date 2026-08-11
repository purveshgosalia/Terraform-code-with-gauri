variable sg_id {
    description = "The ID of the security group to associate with the EC2 instance"
}
variable subnets {
    description = "subnets for ec2 instance"
    type = list(string)
}

variable "ec2_names" {
    description = "List of names for the EC2 instances"
    type        = list(string)
    default     = ["web-1", "web-2"]
}