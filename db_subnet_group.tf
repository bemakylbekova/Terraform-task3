resource "aws_db_subnet_group" "db_subnet_group" {
  name = "main"
  subnet_ids = ["${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}", "${aws_subnet.subnet3.id}"]

  tags = var.common_tags

}