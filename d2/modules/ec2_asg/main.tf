resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = "ami-053a45fff0a704a47"
  instance_type = var.instance_type
  user_data = base64encode("#!/bin/bash\nyum install -y httpd\nsystemctl start httpd\nsystemctl enable httpd\n")

  network_interfaces {
    security_groups = [aws_security_group.ec2_sg.id]
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = var.public_subnet_ids

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }
}