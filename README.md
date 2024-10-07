# Flask-Portfolio

flask-portfolio/
├── app/
│ ├── app.py # Flask app entry point
│ ├── requirements.txt # Python dependencies
│ ├── Dockerfile # Dockerfile for containerizing Flask app
│ └── templates/ # HTML files (if using Flask templates)
│ └── index.html
├── terraform/
│ ├── providers.tf # Main Terraform config (provider and region)
│ ├── variables.tf # Terraform variables
│ ├── outputs.tf # Terraform outputs
│ ├── ecs.tf # ECS Cluster, Task Definitions
│ ├── vpc.tf # VPC, Subnets, Security Groups
│ ├── alb.tf # Load Balancer configuration
│ ├── cloudfront.tf # CloudFront distribution setup
│ ├── route53.tf # Route 53 domain setup
│ ├── acm.tf # ACM for SSL certificates
│ └── mongodb.tf # MongoDB integration (Atlas or local)
├── docker-compose.yml # Docker Compose file (MongoDB + Flask app)
├── .gitignore # Ignore unnecessary files
└── README.md # Project documentation
