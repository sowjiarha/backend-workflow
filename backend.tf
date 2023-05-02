# terraform {
 #  backend "s3" {
  #   bucket = "sowjiexmpleterraform-project-name-bootstrap-terraform-state"
   #  key    = "default-infrastructure"
    # region = "ap-south-1"
   #}
#}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "sowjiexample2terraform-project-name-bootstrap-terraform-state"

  versioning {
    enabled = true
  }
}
