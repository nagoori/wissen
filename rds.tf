resource "aws_db_subnet_group" "db-subnet" {
  name = "db-subnet"
  # vpc_id      = "aws_vpc.terraform-vpc.id"
  subnet_ids = [aws_subnet.hari-data-subnet-1a.id, aws_subnet.hari-data-subnet2-1b.id , aws_subnet.hari-data-subnet3-1c.id]
  # availability_zone       = ["${ap-south-1a}","${ap-south-1b}"]
  tags = {
    Name = "My DB subnet group"
  }
}




resource "aws_db_instance" "my-test-sql" {
  instance_class          = "db.t3.micro"
  engine                  = "mysql"
  engine_version          = "5.7"
  multi_az                = true
  storage_type            = "gp2"
  allocated_storage       = 20
  name                    = "mytestrds"
  username                = "admin"
  password                = "admin123"
  apply_immediately       = "true"
  backup_retention_period = 10
  backup_window           = "09:46-10:16"
  db_subnet_group_name    = "${aws_db_subnet_group.db-subnet.name}"
  vpc_security_group_ids  = ["${aws_security_group.rds-security-group.id}"]


}