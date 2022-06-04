resource "aws_vpc" "prod_like" {
  cidr_block = "10.0.0.0/16"

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "prod_like" {
  vpc_id = aws_vpc.prod_like.id
  tags   = local.tags
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_subnet" "prod_like_public" {
  vpc_id     = aws_vpc.prod_like.id
  cidr_block = "10.0.2.0/24"

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "public_rt" {
    vpc_id =  aws_vpc.prod_like.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.prod_like.id
    }
    lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id = aws_subnet.prod_like_public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "SSH from my PC"
  vpc_id      = aws_vpc.prod_like.id

  ingress {
    description = "SSH from my PC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["213.207.186.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}
