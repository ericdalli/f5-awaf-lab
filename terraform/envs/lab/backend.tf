terraform {
  backend "s3" {
    bucket         = "ericdalli-tfstate-f5-awaf-lab"
    key            = "f5-awaf-lab/lab.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
