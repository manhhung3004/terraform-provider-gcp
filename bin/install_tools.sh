#!/bin/bash

# Script: install_gsutil.sh
# Purpose: Install Google Cloud SDK and gsutil

set -e

sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update -y

sudo apt-get install google-cloud-cli google-cloud-cli google-cloud-cli

gcloud components install gsutil beta bq

gcloud auth login

gsutil version
