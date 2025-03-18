resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnets" {
  value = aws_subnet.subnets[*].id
}
