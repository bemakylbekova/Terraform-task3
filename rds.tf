resource "aws_rds_cluster" "aurora" {
  cluster_identifier        = "taskdb"
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  engine                    = "aurora-mysql"
  database_name             = "mydb"
  master_username           = var.username
  master_password           = var.password
  db_subnet_group_name      = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids    = [aws_security_group.mySQL_sg.id]
  skip_final_snapshot       = true

  tags = var.common_tags

}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                = 2
  identifier           = "task-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = "db.r4.large"
  engine               = aws_rds_cluster.aurora.engine
  engine_version       = aws_rds_cluster.aurora.engine_version
  db_subnet_group_name = aws_rds_cluster.aurora.db_subnet_group_name
  apply_immediately    = true
  publicly_accessible  = true

  tags = var.common_tags
}

