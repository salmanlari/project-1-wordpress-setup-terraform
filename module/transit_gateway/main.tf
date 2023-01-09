resource "aws_ec2_transit_gateway" "aws_transit_gatway" {
  description = "example"
}


resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_transit_attach_1" {
  subnet_ids         = [var.subnet_1_ids]
  transit_gateway_id = aws_ec2_transit_gateway.aws_transit_gatway.id
  vpc_id             = var.vpc_1_id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_transit_attach_2" {
  subnet_ids         = [var.subnet_2_ids]
  transit_gateway_id = aws_ec2_transit_gateway.aws_transit_gatway.id
  vpc_id             = var.vpc_2_id
}

