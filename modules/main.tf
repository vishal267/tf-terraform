provider "aws" {
  region = var.region_name
}

module "webapp_vpc" {
  source = "./vpc"

  environment     = var.environment
  region_name     = var.region_name

  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "webapp_cluster" {
  source = "./webapp_cluster"

  eks_subnet_ids   = flatten([module.webapp_vpc.priv_subnets])
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  cluster_role     = var.cluster_role

  depends_on = [
    module.webapp_vpc
  ]
}

module "eks_node_group" {
  source = "./node_group"

  eks_subnet_ids    = flatten([module.webapp_vpc.priv_subnets])
  eks_cluster_name  = module.webapp_cluster.cluster_name
  eks_cluster_version  = var.eks_cluster_version
  node_group_name   = var.node_group_name
  node_role_name    = var.node_role_name
  nodegroup_keypair = var.nodegroup_keypair

  depends_on = [
    module.webapp_cluster,
    module.webapp_vpc
  ]
}
