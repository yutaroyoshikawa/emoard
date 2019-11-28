resource "aws_ecs_cluster" "ecs_cluster" {
  name = "emoard"
}

resource "aws_ecs_task_definition" "emoard" {
  container_definitions    = "${file("${path.module}/task_definitions.json")}"
  family                   = "emoard"
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "${aws_iam_role.emoard.arn}"
}

resource "aws_ecs_service" "nginx" {
  name                              = "emoard-nginx"
  cluster                           = "${aws_ecs_cluster.ecs_cluster.arn}"
  task_definition                   = "${aws_ecs_task_definition.emoard.arn}"
  desired_count                     = 2
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = ["${aws_security_group.emoard.id}"]

    subnets = [
      "${aws_subnet.private_a.id}",
      "${aws_subnet.private_b.id}"
    ]
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.emoard.arn}"
    container_name   = "emoard"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = ["task_definition"]
  }
}
