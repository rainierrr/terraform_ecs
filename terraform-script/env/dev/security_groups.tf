# Security Group ===========================================
resource "aws_security_group" "security-group" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "rainier-security-group"
  description = "test security group"
  tags = {
    Name = "rainier-security-group"
  }
}

# インバウンドルール(ssh接続用)
resource "aws_security_group_rule" "in_ssh" {
  security_group_id = aws_security_group.security-group.id
  description       = "inbound role for ssh"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# インバウンドルール(pingコマンド用)
resource "aws_security_group_rule" "in_icmp" {
  security_group_id = aws_security_group.security-group.id
  description       = "inbound role for ping"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
}


# Security Group ===========================================
resource "aws_security_group" "http" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "http"
  description = "for http"
  tags = {
    Name = "http"
  }
}

# application-from-http
resource "aws_security_group_rule" "in_http" {
  security_group_id = aws_security_group.http.id
  description       = "in_http"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
}
resource "aws_security_group_rule" "http-outbound" {
  security_group_id = aws_security_group.http.id
  description       = "outbound"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}


resource "aws_security_group" "nfs" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "nfs"
  description = "for-nfs"
  tags = {
    Name = "nfs"
  }
}

# application-from-http
resource "aws_security_group_rule" "in_nfs" {
  security_group_id = aws_security_group.nfs.id
  description       = "nfs port"
  type              = "ingress"
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
}




resource "aws_security_group_rule" "nfs-outbound" {
  security_group_id = aws_security_group.nfs.id
  description       = "outbound"
  type              = "egress"
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
