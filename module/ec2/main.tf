
#### CREATING 1st  EC2 ######
resource "aws_instance" "ec2" {  
  ami                 = var.ami_id
  instance_type       = var.ec2_type
  subnet_id           = var. subnet_1
  security_groups     = [var.sg]
  key_name            = var.ssh_key
 iam_instance_profile = var.iam_instance_profile
 user_data            = file("${path.module}/wp.sh")


tags = {  

       Name = var.ec2-tag-name   
  } 
}

#### CREATING 2nd  EC2 ######

resource "aws_instance" "ec2_2" {  
  ami                = var.ami_id_2
  instance_type      = var.ec2_type_2
  subnet_id          = var.subnet_2
  security_groups    = [var.sg_2]
  key_name           = var.ssh_key_2
  user_data          = file("${path.module}/mysql.sh")
 
  tags = {  
       Name = var.ec2-tag-name-2
    
  } 
}