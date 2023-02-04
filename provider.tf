

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.10"
    }

    namedotcom = {
      source = "lexfrei/namedotcom"
      version = "1.2.4"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "iamadmin-general"
}

provider "namedotcom" {
  token = var.token
  username = var.username
}