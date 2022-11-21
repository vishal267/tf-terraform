generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "k8s-webapp"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        region  = "us-west-2"
        encrypt = true
    }
}
EOF
}
