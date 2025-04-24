# Deploying a Static Website on Google Cloud Storage with Terraform

This guide provides instructions for deploying a static website on Google Cloud Storage using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- A Google Cloud Platform (GCP) account.
- The `gcloud` CLI installed and authenticated.
- A GCP project created and set as the active project.

## Steps to Deploy

### 1. Initialize Terraform
Run the following command to initialize Terraform in the current directory:
```bash
terraform init
```

### 2. Plan the Infrastructure
Review the changes Terraform will make:
```bash
terraform plan
```

### 3. Apply the Configuration
Deploy the static website by applying the Terraform configuration:
```bash
terraform apply
```

### 4. Upload Website Files
After the bucket is created, upload your static website files to the bucket:
```bash
gsutil cp -r ./website/* gs://<your-bucket-name>
```

### 5. Access the Website
Once the files are uploaded, you can access your static website using the bucket's public URL.

## Example Terraform Configuration

Below is an example Terraform configuration for deploying a static website:

```hcl
provider "google" {
    project = "<your-project-id>"
    region  = "us-central1"
}

resource "google_storage_bucket" "static_website" {
    name          = "<your-bucket-name>"
    location      = "US"
    website {
        main_page_suffix = "index.html"
        not_found_page   = "404.html"
    }
    force_destroy = true
}

resource "google_storage_bucket_iam_binding" "public_access" {
    bucket = google_storage_bucket.static_website.name
    role   = "roles/storage.objectViewer"
    members = [
        "allUsers",
    ]
}
```

Replace `<your-project-id>` and `<your-bucket-name>` with your GCP project ID and desired bucket name.

## Cleanup

To remove the resources created by Terraform, run:
```bash
terraform destroy
```

## References

- [Terraform GCP Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Hosting a Static Website on Google Cloud Storage](https://cloud.google.com/storage/docs/hosting-static-website)
- [Bài 4 - Dùng Terraform để triển khai trang web lên S3] (https://devopsvn.tech/terraform-series/terraform/bai-4-dung-terraform-de-trien-khai-trang-web-len-s3)
