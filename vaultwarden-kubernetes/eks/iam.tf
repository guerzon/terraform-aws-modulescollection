resource "aws_iam_role" "cluster" {
  name               = "VaultwardenEKSClusterIAMRole-${var.environment}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ]
}
    POLICY
}

resource "aws_iam_role" "nodes" {
  name               = "VaultwardenEKSNodesIAMRole-${var.environment}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
    POLICY
}

## Allows EKS to create EC2 instances and Load-balancers
resource "aws_iam_role_policy_attachment" "cluster" {
  role       = aws_iam_role.cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "nodes" {
  for_each = var.node_iam_policies

  role       = aws_iam_role.nodes.name
  policy_arn = each.value
}
