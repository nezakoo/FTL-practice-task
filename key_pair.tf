resource "aws_key_pair" "ec2_application_key" {
  key_name   = "ec2_application_key"
  public_key = file("../FTL-app-key.pub")
}
