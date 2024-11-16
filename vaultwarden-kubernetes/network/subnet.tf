resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name                                                                           = "vaultwarden-${var.environment}-private-${count.index + 1}",
    "kubernetes.io/role/internal-elb"                                              = 1,
    "kubernetes.io/cluster/vaultwarden-${var.environment}-${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name                                                                           = "vaultwarden-${var.environment}-public-${count.index + 1}",
    "kubernetes.io/role/elb"                                                       = 1,
    "kubernetes.io/cluster/vaultwarden-${var.environment}-${var.eks_cluster_name}" = "owned"
  }
}