
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
  access_key = "YOUR_KEY_AWS"
  secret_key = "YOUR_SECRETE_AWS"
}

resource "aws_security_group" "jenkins_seg" {
  name        = "jenkins_seg"
  description = "Allow Jenkins Traffic"
  vpc_id      = var.vpc_id

  

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks = var.cidr
    self             = false
   }
  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = var.cidr
    self             = false
   }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins SG"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  key_name        = "aws_key"
  security_groups = [aws_security_group.jenkins_seg.name]
  user_data       = "${file("install_jenkins.sh")}"
  tags = {
    Name = "JenkinServer"
  }


   connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("/Users/artmcair/workspace/macAwsPuKey")
      timeout     = "4m"
   }
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa YOR_RSA_KEY"


}
