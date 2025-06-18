#!/bin/bash

# Set values
KEY_NAME="your-key-pair-name"  # 🔐 Replace with your actual key pair name

# Export AWS credentials if needed (optional if already configured)
# export AWS_ACCESS_KEY_ID="your-access-key-id"
# export AWS_SECRET_ACCESS_KEY="your-secret-access-key"

echo "🚀 Initializing Terraform..."
terraform init

echo "📦 Validating configuration..."
terraform validate

echo "📊 Planning infrastructure..."
terraform plan -var="key_name=$KEY_NAME"

echo "☁️ Deploying infrastructure..."
terraform apply -var="key_name=$KEY_NAME" -auto-approve

echo "✅ Deployment complete."
