resource "aws_vpc" "prod_like" {
  cidr_block = "10.0.0.0/16"

  tags = local.tags
}

resource "aws_subnet" "prod_like_private" {
  vpc_id     = aws_vpc.prod_like.id
  cidr_block = "10.0.1.0/24"

  tags = local.tags
}
