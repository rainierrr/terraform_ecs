provider "aws" {
  region = "ap-northeast-1"
}
# 自分のアカウントID 参照
data "aws_caller_identity" "self" {}


/*
resource "aws_subnet" "rainier_private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "rainier_private2"
  }
}

resource "aws_route_table_association" "association_internship_private1" {
  subnet_id      = aws_subnet.rainier_private01.id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "association_internship_private2" {
  subnet_id      = aws_subnet.rainierprivate02.id
  route_table_id = var.private_route_table_id
}
*/