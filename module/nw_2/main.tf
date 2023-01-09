
#vpc
resource "aws_vpc" "aws_vpc_2" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

 tags = {
    Name = "${terraform.workspace}_vpc_2"

  }
}


#PVT_SUBNET
resource "aws_subnet" "pvt_snet_2" {
vpc_id               = aws_vpc.aws_vpc_2.id
cidr_block            = var.pvt_cidr_block_2
availability_zone     = var.pvt_az_2
map_public_ip_on_launch = true

   tags = {
    Name = "${terraform.workspace}_snet_vpc_2"

  }

}

#IGW

resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.aws_vpc_2.id

   tags = {
    Name = "${terraform.workspace}_igw_vpc_2"

  }

}

#ROUTE_TABLE

resource "aws_route_table" "aws_rt" {
  vpc_id = aws_vpc.aws_vpc_2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  
  }

  route {
   cidr_block = var.vpc_cidr_1
   transit_gateway_id= var.transit_gateway_id
    
  }

   tags = {
    Name = "${terraform.workspace}_rt_vpc_2"

  }
}

#ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "aws_rta" {
  subnet_id      = aws_subnet.pvt_snet_2.id
  route_table_id = aws_route_table.aws_rt.id


}