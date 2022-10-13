provider "aws" {
	region = "us-east-2"
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