provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2-block-1" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  key_name      = "mumbai-off"
  subnet_id     = "subnet-04e12b0344a8449e6"
  vpc_security_group_ids = ["sg-0991a6b0d1db1a49a"]
  associate_public_ip_address = false // Make sure to set this to false if you're using an Elastic IP

  tags = {
    Name = "Instance-with-elastic-IP"
  }
}

data "aws_eip" "existing" {
  id = "eipalloc-0f1253bd6009729df"
}

resource "aws_eip_association" "attach" {
  instance_id   = aws_instance.ec2-block-1.id
  allocation_id = data.aws_eip.existing.id
}

output "instance_info" {
  value = {
    instance_id = aws_instance.ec2-block-1.id
    IP_address = aws_eip_association.attach.public_ip
  }
}
