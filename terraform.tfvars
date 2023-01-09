
#VPC
#vpc-1
ipv4_vpccidr = "10.0.0.0/16"
pvt_cidr_block = "10.0.4.0/22"
pvt_az         = "us-east-1a"


#vpc -2

ipv4_vpc_cidr    = "192.168.0.0/18"
pvt_cidr_block_2 = "192.168.4.0/22"
pvt_az_2         = "us-east-1b"


#Security Group-1

sg_details = {
  ec2-sg = {
    name        = "ec2"
    description = "allow port HTTP & SSH incoming"

    ingress_rules = [
      {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

      },
      {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

      },

      {
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

    ]
  }
}

#Security Group-2

sg_details_2 = {
  ec2-sg_2 = {
    name        = "ec2_2"
    description = "allow port HTTP & SSH incoming"

    ingress_rules = [
      {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

      },

      {
        from_port   = "3306"
        to_port     = "3306"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

    ]
  }
}




##EC2-1

ami_id   = "ami-08c40ec9ead489470"
ec2_type = "t2.micro"
ssh_key  = "salman_nv_key"
ec2-tag-name   = "server-1"

##EC2-2
ami_id_2   = "ami-08c40ec9ead489470"
ec2_type_2 = "t2.micro"
ssh_key_2  = "salman_nv_key"
ec2-tag-name-2 = "server-2"