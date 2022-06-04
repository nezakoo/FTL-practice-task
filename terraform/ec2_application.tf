module "ec2_application" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "4.0.0"
  name                        = "application"
  ami                         = data.aws_ami.ubuntu20_04.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.prod_like_public.id
  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.ec2_application_key.key_name
  vpc_security_group_ids      = [aws_security_group.ssh.id, aws_security_group.http.id, aws_security_group.https.id]

  tags = merge(local.tags, {
    Name = "application_ec2"
  })

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 100
    }
  ]
  volume_tags = merge(local.tags, {
    Name = "application_ebs"
  })
}
