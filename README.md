# Flask-Portfolio (Work in Progress)

This project is a Flask web application containerized with Docker and deployed on AWS using Terraform. The architecture includes a MongoDB database and utilizes various AWS services for scalability and availability.

## File Structure (Not final)

```
flask-portfolio/
├── app/
│ ├── server.py # Flask app entry point
│ ├── requirements.txt # Python dependencies
│ ├── Dockerfile # Dockerfile for containerizing Flask app
│ ├── static/ # CSS, JS, images and other static files
│ ├── templates/ # HTML files
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
```
