# F5 Advanced WAF Lab (AWS)

This repository demonstrates a production-like F5 Advanced WAF deployment on AWS using:

- Terraform (infrastructure as code)
- F5 AS3 (application & WAF configuration)
- GitHub Actions (CI/CD)
- AWS OIDC authentication (no static keys)

## Architecture (Lab)
- Dedicated AWS VPC
- F5 BIG-IP Advanced WAF (Per-App VE)
- Backend test application (Amazon Linux + nginx)
- Remote Terraform state (S3 + DynamoDB)
- Secrets via AWS SSM Parameter Store

## Goals
- Reproducible lab environment
- WAF policy automation (blocking mode)
- CI/CD driven deployment
- Close-to-production best practices

> This is a learning and portfolio lab, not a production environment.
