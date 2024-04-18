provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "resourceblock1" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  key_name      = "mumbai-off"
  subnet_id     = "subnet-04e12b0344a8449e6"
  vpc_security_group_ids = ["sg-0991a6b0d1db1a49a"]
  associate_public_ip_address = true
  tags = {
    Name = "instance-output-block"
  }
}

output "instance_info" {
  value = {
    instance_id = aws_instance.resourceblock1.id
    keypair	= aws_instance.resourceblock1.key_name
    subnet_id	= aws_instance.resourceblock1.subnet_id
    ami_id      = aws_instance.resourceblock1.ami
  }
}
