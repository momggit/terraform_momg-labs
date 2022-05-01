terraform {
  backend "s3" {
    bucket         = "632632586120-us-west-2-terraform"
    key            = "terraform/states/momg-labs.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-scale-lock"
  }
}
