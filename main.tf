provider "aws" {
  region = "us-east-1"

}

# NETWORK

module "nw" {
  source             = "./module/nw"
  vpccidr            = var.ipv4_vpccidr
  pvt_cidr_block     = var.pvt_cidr_block
  pvt_az             = var.pvt_az
  vpc_cidr_2         = "192.168.0.0/18"
  transit_gateway_id = module.transit_gateway.aws_ec2_transit_gateway_output

}
module "nw_2" {
  source             = "./module/nw_2"
  vpc_cidr           = var.ipv4_vpc_cidr
  pvt_cidr_block_2   = var.pvt_cidr_block_2
  pvt_az_2           = var.pvt_az_2
  vpc_cidr_1         = "10.0.0.0/16"
  transit_gateway_id = module.transit_gateway.aws_ec2_transit_gateway_output
}

module "transit_gateway" {
  source       = "./module/transit_gateway"
  subnet_1_ids = module.nw.pvt_snet_output_id.id
  vpc_1_id     = module.nw.aws_vpc_output_id

  subnet_2_ids = module.nw_2.pvt_snet_output_2_id.id
  vpc_2_id     = module.nw_2.aws_vpc_output_2_id

}

# # ec2 security group

module "sg" {
  source     = "./module/sg"
  vpc_id     = module.nw.aws_vpc_output_id
  sg_details = var.sg_details

}

module "sg_2" {
  source       = "./module/sg_2"
  vpc_id_2     = module.nw_2.aws_vpc_output_2_id
  sg_details_2 = var.sg_details_2

}

# # # #EC2 
module "iam" {
  source = "./module/iam"
}

module "ec2" {
  source               = "./module/ec2"
  ami_id               = var.ami_id
  ec2_type             = var.ec2_type
  ssh_key              = var.ssh_key
  subnet_1             = module.nw.pvt_snet_output_id.id
  ec2-tag-name         = var.ec2-tag-name
  iam_instance_profile = module.iam.aws_iam_instance_profile_output.name
  sg                   = lookup(module.sg.sg_output_id, "ec2-sg", null)


  ##EC2=2
  ami_id_2       = var.ami_id_2
  ec2_type_2     = var.ec2_type_2
  ssh_key_2      = var.ssh_key_2
  subnet_2       = module.nw_2.pvt_snet_output_2_id.id
  ec2-tag-name-2 = var.ec2-tag-name-2

  sg_2 = lookup(module.sg_2.sg_output_id_2, "ec2-sg_2", null)

}

# output "ec2_output" {
#     value = module.ec2.ec2_output
# }