data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = "${data.aws_iam_policy.ecs_task_execution_role_policy.policy}"

  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameters",
      "kms:Decrypt"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "emoard" {
  name   = "emoard-policy-ecs-task-execution"
  policy = "${data.aws_iam_policy_document.ecs_task_execution.json}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "emoard" {
  name               = "emoard-role-ecs-task-execution"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "emoard" {
  role       = "${aws_iam_role.emoard.name}"
  policy_arn = "${aws_iam_policy.emoard.arn}"
}
