terraform {
  backend "s3" {
    bucket = "fauji-terraform-state",
    key="aws-infra",
    region = "ap-south-1",
    acl = "bucket-owner-full-control"

  }
}