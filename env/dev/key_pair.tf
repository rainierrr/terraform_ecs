resource "aws_key_pair" "this" {
  key_name   = "rainier-key"
  public_key = file("~/.ssh/rainier_pub.key")
  tags = {
    Name = "rainier_pub_key"
  }
}
