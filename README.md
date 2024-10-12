# Flask-Portfolio (Work in Progress)

This project is a Flask web application containerized with Docker and deployed on AWS using Terraform. The architecture includes a MongoDB database and utilizes various AWS services for scalability and availability.

## File Structure (Not final)

```
flask-portfolio/
├── App/
│ ├── static/ # CSS, JS, images and other static files
│ ├── templates/ # HTML files
│ ├── database.csv # csv file to store data
│ ├── requirements.txt # Python dependencies
│ └── server.py # Flask app entry pointtemplates/ # HTML files
├── IaC/
│ ├── providers.tf # Main Terraform config (provider and region)
│ ├── variables.tf # Terraform variables
│ ├── outputs.tf # Terraform outputs
│ ├── ecs.tf # ECS Cluster, Task Definitions
│ ├── vpc.tf # VPC, Subnets, Security Groups
│ ├── alb.tf # Load Balancer configuration
│ ├── route53.tf # Route 53 domain setup
│ └── acm.tf # ACM for SSL certificates
├── docker-compose.yml # Docker Compose file (coming soon)
├── .gitignore # Ignore unnecessary files
├── Dockerfile # Dockerfile for containerizing Flask app
└── README.md # Project documentation
```

## Architecture

### Coming Soon
