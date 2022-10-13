provider "aws" {
	region = "us-east-2"
}

resource "aws_instance" "ec2Instance" {
	ami = "ami-097a2df4ac947655f"
	instance_type = "t2.micro"

    tags = {
		Name = "EC2 Terraform Onboarding1"
	}
    vpc_security_group_ids = [aws_security_group.sgOnboarding.id]

}

resource "aws_security_group" "sgOnboarding" {
	name = "terraform-tcp-sg-onboarding"
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}