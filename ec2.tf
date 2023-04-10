provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tfinstance" {
  ami           = "ami-0abe3b3d135a5b984"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0ea18b012eb1b5011"
  key_name      = "n-virginia-keypair"
  associate_public_ip_address = true

  tags = {
    Name = "tf-ec2"
  }
}

#resource "aws_eip" "test" {
 # vpc      = true
 # instance = aws_instance.tfinstance.id
#}
