resource "aws_security_group" "bigip_mgmt" {
  name        = "${var.lab_name}-bigip-mgmt-sg"
  description = "BIG-IP mgmt access (8443/22) restricted to admin_cidr"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description = "BIG-IP GUI (8443)"
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "SSH (22)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.lab_name}-bigip-mgmt-sg"
    Environment = "lab"
    Project     = var.lab_name
  }
}

resource "aws_security_group" "bigip_app" {
  name        = "${var.lab_name}-bigip-app-sg"
  description = "BIG-IP data plane access (80/443) from allow_app_from_cidr"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description = "HTTP (80)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allow_app_from_cidr]
  }

  ingress {
    description = "HTTPS (443)"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.allow_app_from_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.lab_name}-bigip-app-sg"
    Environment = "lab"
    Project     = var.lab_name
  }
}

resource "aws_security_group" "backend" {
  name        = "${var.lab_name}-backend-sg"
  description = "Backend allows HTTP only from BIG-IP app SG"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description     = "HTTP from BIG-IP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.bigip_app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.lab_name}-backend-sg"
    Environment = "lab"
    Project     = var.lab_name
  }
}
