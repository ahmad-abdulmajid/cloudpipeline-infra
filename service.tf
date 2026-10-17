resource "aws_ecs_service" "app" {
  name            = "pipewright-app"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 0
  launch_type     = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets          = sort(data.aws_subnets.default.ids)
    security_groups  = [aws_security_group.app.id]
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count
    ]
  }

  depends_on = [
    aws_iam_role_policy.execution
  ]
}
