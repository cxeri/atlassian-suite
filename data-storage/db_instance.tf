resource "aws_db_instance" "db" {
  instance_class         = "${var.instance_class}"
  allocated_storage      = "${var.allocated_storage}"
  engine                 = "${var.engine}"
  storage_type           = "gp2"
  identifier             = "${var.tag}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${aws_security_group.db.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.db.name}"

  tags {
    Name = "${var.tag}"
  }
}
