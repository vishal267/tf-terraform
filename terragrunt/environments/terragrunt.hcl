generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "k8s-webapp-tf"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        region  = "ap-south-1"
        encrypt = true
    }
}
EOF
}
