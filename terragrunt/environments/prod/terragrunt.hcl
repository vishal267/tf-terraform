### Declaring the variable related to Production environment 
### command used "

include "remote_state" {
  path = find_in_parent_folders()
}

locals {
  region = "ca-central-1"
}

inputs = {
  environment         = "Production"
  eks_cluster_name    = "Prod-EKS-WEBAPP"
  eks_cluster_version = "1.22"
  node_group_name     = "webapp-prod-01"
  node_role_name      = "NodeRole-prod"
  nodegroup_keypair   = "webapp-prod-01-key"
  cluster_role        = "AWSEKSClusterRole-prod"
  region_name         = local.region
  vpc_cidr_block      = "10.50.0.0/16"
  public_subnets = {
    "${local.region}a" = "10.50.0.0/24"
    "${local.region}b" = "10.50.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.50.1.0/24"
    "${local.region}b" = "10.50.3.0/24"
  }
}
