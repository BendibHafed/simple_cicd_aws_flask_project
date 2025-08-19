# Serverless Flask App with Terraform + GitHub Actions CI/CD

This project demonstrates a **simple AWS Lambda + API Gateway** setup, managed with **Terraform**, and deployed through a **GitHub Actions CI/CD pipeline**.  
The Lambda returns a basic `"Hello CI/CD"` message, showcasing an end-to-end workflow for infrastructure as code and automated deployments.

---

##  Project Structure
.
├── app/ # Flask app source code
│ ├── app.py # Lambda handler
│ └── requirements.txt # Python dependencies
├── terraform/ # Terraform IaC for Lambda + API Gateway
│ └── main.tf
├── .github/workflows/ # CI/CD workflows
│ ├── ci.yaml # Runs tests + terraform plan (local backend)
│ ├── cd.yaml # Deploys to AWS (S3 + DynamoDB backend)
│ └── destroy.yaml # Manual destroy workflow
└── README.md


---

## Workflows

### 🔹 Continuous Integration (CI) – `.github/workflows/ci.yaml`
- Runs on **pull requests** to `main`.
- Installs dependencies and runs **pytest**.
- Builds a Lambda deployment package (`app.zip`).
- Runs `terraform plan` with a **local backend** (no AWS state).

### 🔹 Continuous Deployment (CD) – `.github/workflows/cd.yaml`
- Runs on **push to `main`**.
- Runs tests again for safety.
- **Bootstraps Terraform backend** (S3 bucket + DynamoDB table if missing).
- Packages Flask app (or downloads artifact if available).
- Runs `terraform apply` → deploys:
  - Lambda function
  - API Gateway HTTP API
  - IAM Role + permissions
- Outputs your deployed **API Gateway URL**.

### 🔹 Destroy Workflow – `.github/workflows/destroy.yaml`
- Triggered manually (`workflow_dispatch`).
- Runs `terraform destroy` to remove all AWS resources.
- Cleans up local state files.

---

## Setup

### 1. Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>=1.1`
- AWS account with permissions for:
  - S3, DynamoDB, Lambda, API Gateway, IAM
- GitHub repository with:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`  
  stored as **Actions secrets**.

### 2. Deploy via GitHub Actions
- Merge or push to `main`.
- Wait for the **CD pipeline** to finish.
- Find your deployed API Gateway URL in the workflow logs:

```bash
terraform output api_url
https://abc123.execute-api.us-west-2.amazonaws.com

Visit this URL → you should see: Hello CI/CD
![CI/CD Pipeline](assets/cicd_pipeline.png)
