provider "aws" {
  region = "ap-south-1"
}

variable "instance_names" {
  type    = list(string)
  default = ["tfinstance1", "tfinstance2", "tfinstance3", "kishore"]
}

resource "aws_instance" "example" {
  count         = length(var.instance_names)
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t3.micro"
  key_name      = "mumbai-off"
  subnet_id     = "subnet-04e12b0344a8449e6"
  tags = {
    Name = var.instance_names[count.index]
  }
}
