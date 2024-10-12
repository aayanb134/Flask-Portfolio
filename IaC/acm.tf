provider "aws" {
  alias = "us-east-1"
}

module "acm" {
  source = "terraform-aws-modules/acm/aws"
  providers = {
    aws = aws.us-east-1
  }
  version = "5.1.1"

  domain_name = "aayan-resume.com"
  zone_id     = "Z08142412D2LIYVLOF838"

  wait_for_validation = true

  tags = {
    Name = "aayan-resume.com"
  }
}
