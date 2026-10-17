resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/pipewright-app"
  retention_in_days = 7
}
