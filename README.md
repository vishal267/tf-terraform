# Terraform modules to create vpc, eks, eks-node-groups

# Terragrunt command to run terraform commands that will launch the infra

cd terragrunt/environments/prod


terragrunt plan --terragrunt-source ../../../modules/
