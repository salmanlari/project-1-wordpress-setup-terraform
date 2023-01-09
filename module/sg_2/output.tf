output "sg_output_id_2" {
    value={for k , v in aws_security_group.sg_2: k => v.id}  
}