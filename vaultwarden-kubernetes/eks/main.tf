resource "aws_eks_cluster" "this" {
  name     = "vaultwarden-${var.environment}-${var.eks_cluster_name}"
  version  = var.k8s_version
  role_arn = aws_iam_role.cluster.arn
  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = false
    endpoint_public_access  = true
  }
  depends_on = [aws_iam_role_policy_attachment.cluster]
}