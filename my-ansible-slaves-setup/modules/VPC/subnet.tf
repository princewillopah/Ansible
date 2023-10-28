# subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.Ansible-vpc.id  #the only requiered atteributes
  cidr_block = var.subnet_cidr_block[0]
  availability_zone = var.VPC_avail_zone[0]
  tags = {
    Name = "${var.vpc_env_prefix}-subnet-1"
  }
}


# subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.Ansible-vpc.id  #the only requiered atteributes
  cidr_block = var.subnet_cidr_block[1]
  availability_zone = var.VPC_avail_zone[1]
  tags = {
    Name = "${var.vpc_env_prefix}-subnet-2"
  }
}

# resource "aws_subnet" "public_subnets" {
#  vpc_id            = aws_vpc.Ansible-vpc.id
#  count             = length(var.subnet_cidr_block)
#  cidr_block        = element(var.subnet_cidr_block, count.index)
#  availability_zone = element(var.VPC_avail_zone, count.index)
#    map_public_ip_on_launch = true
#  tags = {
#    Name = "Public Subnet ${count.index + 1}"
#  }
# }