

terraform {
  backend "s3" {
    bucket  = "project-altschool-terraform-state"
    region  = "us-east-1"
    key     = "terraform-statefile"
    profile = "iamadmin-general"
  }
}

