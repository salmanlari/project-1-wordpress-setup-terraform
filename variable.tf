
#Network Variable

variable "ipv4_vpccidr" {
  description = "CIDR block for vpc"
  type        = string
}


variable "pvt_cidr_block" {

}
variable "pvt_az" {

}

variable "ipv4_vpc_cidr" {

}
variable "pvt_cidr_block_2" {

}
variable "pvt_az_2" {

}


# ### Security Group variable
variable "sg_details" {
  type = map(object({
    name        = string
    description = string

    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)


    }))
  }))

}

variable "sg_details_2" {
  type = map(object({
    name        = string
    description = string

    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)


    }))
  }))

}

# # #ec2 variable

variable "ami_id" {
  description = "EC2 instance AMI ID"
  type        = string
  # validation {
  # condition = (
  #     length(var.ami_id) > 6 &&
  #     substr(var.ami_id, 0, 4) == "ami-"
  # )
  # error_message = "The ami_id value must start with \"ami-\"."
  # }


}
variable "ec2_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ssh_key" {
  description = "EC2 instance ssh key"
  type        = string
}

variable "ami_id_2" {
  description = "EC2 instance AMI ID"
  type        = string
  # validation {
  # condition = (
  #     length(var.ami_id) > 6 &&
  #     substr(var.ami_id, 0, 4) == "ami-"
  # )
  # error_message = "The ami_id value must start with \"ami-\"."
  # }


}
variable "ec2_type_2" {
  description = "EC2 instance type"
  type        = string
}

variable "ssh_key_2" {
  description = "EC2 instance ssh key"
  type        = string
}

variable "ec2-tag-name" {

}
variable "ec2-tag-name-2" {

}