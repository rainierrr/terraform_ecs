# VPC =======================================================
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "rainier_vpc"
  }
}

# Subnet ===================================================
resource "aws_subnet" "rainier_private01" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "ap-northeast-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "rainier_subnet_01"
  }
}
/*
resource "aws_subnet" "rainier_private2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.20.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet2"
  }
}

# Internet Gateway =========================================
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "main-gw"
  }
}
# Route Table ===========================================
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "rainier-route-table"
  }
}
# ルーティング情報追加
resource "aws_route" "route" {
  gateway_id             = aws_internet_gateway.gw.id
  route_table_id         = aws_route_table.route-table.id
  destination_cidr_block = "0.0.0.0/0"
}


# ルーティングテーブルとサブネットの関連付け
resource "aws_route_table_association" "table_association_main" {
  subnet_id      = aws_subnet.internship_private1.id
  route_table_id = aws_route_table.route-table.id
}


resource "aws_route_table_association" "table_association_sub" {
  subnet_id      = aws_subnet.internship_private2.id
  route_table_id = aws_route_table.route-table.id
}

*/