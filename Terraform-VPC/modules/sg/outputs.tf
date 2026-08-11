output "sg_id" {
    description = "The ID of the security group"
    type        = string  
    value = aws_security_group.sg.id
}