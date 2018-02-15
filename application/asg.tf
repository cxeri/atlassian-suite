resource "aws_autoscaling_group" "application" {
  launch_configuration = "${aws_launch_configuration.application.name}"
  max_size             = 1
  min_size             = 1
  name                 = "${var.tag}_asg"
  vpc_zone_identifier  = ["${data.aws_subnet.private.id}"]

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "${var.tag} server"
  }
}
