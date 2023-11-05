resource "aws_autoscaling_group" "auto_scaling_group" {
  name = "${var.env}-asg"
  desired_capacity = 2
  max_size = 2
  min_size = 1
  vpc_zone_identifier = flatten([
    aws_subnet.private-subnet.*.id,
  ])
  target_group_arns = [
    aws_alb_target_group.alb_target_group.arn,
  ]
  launch_template {
    id = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}

# Launch Template and ASG Resources
resource "aws_launch_template" "launch_template" {
  name          = "launch-template"
  image_id      = var.ami
  instance_type = var.instance_type
  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.sg-ec2.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = ""
    }
  }
  user_data =  base64encode(file("container-setup.sh"))
   key_name = "tf-deploy"
}