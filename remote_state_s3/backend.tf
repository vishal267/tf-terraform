terraform {
  backend "s3" {
    bucket = "k8s-webapp"
    key    = "prod/remote_bucket_s3"
    region = "us-west-2"
  }
}

