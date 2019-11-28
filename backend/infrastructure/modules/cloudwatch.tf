resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/nginx/emoard"
  retention_in_days = 7
}
