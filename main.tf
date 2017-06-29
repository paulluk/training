# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-2378f540
#
# Your subnet ID is:
#
#     subnet-bf2137db
#
# Your security group ID is:
#
#     sg-67393600
#
# Your Identity is:
#
#     datapipe-bat
#

variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {
  type = "string"
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "num_webs" {
  default = 3
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami                    = "ami-2378f540"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-bf2137db"
  vpc_security_group_ids = ["sg-67393600"]
  count                  = "${var.num_webs}"

  Fake command
  
  tags {
    "Identity" = "datapipe-bat"
    Name       = "web ${count.index + 1}/${var.num_webs}"
    Foo        = "bar"
    Zip        = "zap"
  }
}

output "public_ip" {
  value = "${aws_instance.web.*.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}

terraform {
  backend "atlas" {
    name = "pluk/training"
  }
}
