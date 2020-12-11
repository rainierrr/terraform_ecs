provider "aws" {
  region = "ap-northeast-1"
}
# 自分のアカウントID 参照
data "aws_caller_identity" "self" {}

resource "aws_subnet" "internship_private1" {
  vpc_id            = var.internship_vpc
  cidr_block        = "10.0.100.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "internship_prj_private1"
  }
}

resource "aws_subnet" "internship_private2" {
  vpc_id            = var.internship_vpc
  cidr_block        = "10.0.200.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "internshi_prj_private2"
  }
}

resource "aws_route_table_association" "association_internship_private1" {
  subnet_id      = aws_subnet.internship_private1.id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "association_internship_private2" {
  subnet_id      = aws_subnet.internship_private2.id
  route_table_id = var.private_route_table_id
}


