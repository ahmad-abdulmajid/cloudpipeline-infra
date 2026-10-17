resource "aws_security_group" "app" {
  name        = "pipewright-app"
  description = "Allow access to the CloudPipeline demo"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "App HTTP"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound access for image pulls and logs"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "pipewright-app"
    Project = "pipewright"
  }
}
