variable "sg_details" {
    type          = map(object({
    name          = string
    description   = string

    ingress_rules = list(object({
    from_port     = number
    to_port       = number
    protocol      = string
    cidr_blocks   = list(string)


    }))
}))

}

variable "vpc_id" {
  
}