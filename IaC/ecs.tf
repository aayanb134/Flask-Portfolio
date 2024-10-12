resource "aws_ecs_cluster" "app" {
  name = "app-cluster"
}

resource "aws_iam_policy" "ecs-task-role" {
  name        = "ecs-task-role"
  description = "Policy to allow ECS tasks to retrieve secrets and assume roles"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "secretsmanager:GetSecretValue"
        Resource = "arn:aws:secretsmanager:eu-west-2:257747315190:secret:MAIL_User_Pass"
      },
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::257747315190:role/ecs-task-role"
      }
    ]
  })
}


resource "aws_ecs_task_definition" "app" {
  family                   = "flask_app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_policy.ecs-task-role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "flask_container"
    image     = var.docker_image_url
    essential = true
    secrets = [
      {
        name      = "MAIL_USERNAME"
        valueFrom = "arn:aws:secretsmanager:eu-west-2:257747315190:secret:MAIL_User_Pass-ZkmFgL"
      },
      {
        name      = "MAIL_PASSWORD"
        valueFrom = "arn:aws:secretsmanager:eu-west-2:257747315190:secret:MAIL_User_Pass-ZkmFgL"
      }
    ]
    portMappings = [
      {
        containerPort = 5000
        hostPort      = 5000
      }
    ]
  }])
}

resource "aws_ecs_service" "app_service" {
  name            = "flask-service"
  cluster         = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public.id]
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.flask-app-tg.arn
    container_name   = "flask-container"
    container_port   = 5000
  }
}
