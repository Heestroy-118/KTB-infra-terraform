resource "aws_autoscaling_group" "this" {
  name                      = "${var.name}-asg"
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  vpc_zone_identifier       = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  target_group_arns         = var.target_group_arns
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "${var.name}-ec2"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.tags["Project"]
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.tags["Environment"]
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = var.tags["Owner"]
    propagate_at_launch = true
  }

  tag {
    key                 = "ManagedBy"
    value               = var.tags["ManagedBy"]
    propagate_at_launch = true
  }
}
