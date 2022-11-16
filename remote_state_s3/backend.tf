terraform {
  backend "s3" {
    bucket = "k8s-webapp-tf"
    key    = "prod/remote_bucket_s3"
    region = "ap-south-1"
  }
}

