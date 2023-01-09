output "aws_vpc_output_id" {
    value = aws_vpc.aws_vpc.id
  }

  output "pvt_snet_output_id" {
    value = aws_subnet.pvt_snet
  }