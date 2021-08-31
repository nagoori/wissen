#vpc creation
data "aws_vpc" "selected" {
  id = "aws_vpc.Default.id"
}

resource "aws_subnet" "hari-subnet" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-subnet"
  }
}

resource "aws_subnet" "hari-subnet2" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-subnet2"
  }
}

resource "aws_subnet" "hari-data-subnet" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-data-subnet"
  }
}

resource "aws_subnet" "hari-data-subnet2" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-data-subnet2"
  }
}

resource "aws_subnet" "hari-data-subnet3" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-data-subnet3"
  }
}

resource "aws_subnet" "hari-private-subnet" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1"
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block)

  tags = {
    Name = "hari-private-subnet"
  }
}
