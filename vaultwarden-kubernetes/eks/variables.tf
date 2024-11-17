
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "vaultwarden-eks"
}

variable "subnet_ids" {
  description = "List of subnet IDs, must be in different AZs"
  type        = list(string)
}

variable "node_iam_policies" {
  description = "IAM policies to attach to EKS-managed nodes"
  type        = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }
}

variable "node_groups" {
  description = "EKS node groups"
  type        = map(any)
}

variable "enable_irsa" {
  description = "Whether to create an OIDC provider for EKS to enable IRSA"
  type        = bool
  default     = true
}

variable "aws_lb_controller_version" {
  description = "Version of the ALB Controller Helm chart"
  type        = string
  default     = "1.10.0"
}

variable "vpc_id" {
  description = "VPC ID for use by the AWS LB Controller"
  type        = string
}

variable "region" {
  description = "AWS region for use by the AWS LB Controller"
  type        = string
}