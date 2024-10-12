resource "aws_ecs_cluster" "app" {
  name = "app-cluster"
}

resource "aws_iam_role" "ecs-task-role" {
  name = "ecs-task-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
}


resource "aws_ecs_task_definition" "app" {
  family                   = "flask_app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs-task-role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "flask_container"
    image     = var.docker_image_url
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
  }])
}
