provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_traffic" {
  name        = var.sg_name
  description = "Allow inbound traffic (BACKEND S3)"
  ## Can have a vpc_id
  # vpc_id      = aws_vpc.main.id

  # New syntax for declare loops (dynamic ingress)
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.from_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # egress all traffic any protocol (-1)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow traffic (BACKEND S3)"
  }
}

# Create instance
resource "aws_instance" "brayan-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "secondary-key"

  tags = var.tags

  security_groups = [aws_security_group.allow_traffic.name]
}
