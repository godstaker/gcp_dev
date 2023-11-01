#!/bin/bash

# Set the service account name and desired output path
SERVICE_ACCOUNT_NAME="your-service-account-name"
OUTPUT_KEY_FILE="path/to/output/key.json"

# Authenticate with Google Cloud (you may need to run 'gcloud auth login' first)
gcloud auth application-default login

# Create a service account key and save it to the specified file
gcloud iam service-accounts keys create "$OUTPUT_KEY_FILE" --iam-account "$SERVICE_ACCOUNT_NAME@your-project-id.iam.gserviceaccount.com"

# Check if the key creation was successful
if [ $? -eq 0 ]; then
  echo "Service account key exported to $OUTPUT_KEY_FILE"
else
  echo "Failed to export the service account key."
fi
