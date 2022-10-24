provider "aws" {
	region = "us-east-2"
}

resource "aws_instance" "ec2Instance" {
	ami = "ami-089a545a9ed9893b6"
	instance_type = "t2.micro"
  key_name = "diegoKeyPair2"

    tags = {
		Name = "EC2 Terraform Onboarding1"
	}
    vpc_security_group_ids = [aws_security_group.sgOnboarding.id]

}

resource "aws_eip" "ec2lasticeip" {

  instance = aws_instance.ec2Instance.id

  vpc = true

}

/* output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2Instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2Instance.public_ip
} */

resource "aws_security_group" "sgOnboarding" {
	name = "terraform-tcp-sg-onboarding"
	
	ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}
resource "local_file" "tf_variables_ansible" {
  content = <<-DOC
    [ec2Instance] 
    ${aws_eip.ec2lasticeip.public_ip}
    DOC
  filename = "ansible/hosts.inv"
}