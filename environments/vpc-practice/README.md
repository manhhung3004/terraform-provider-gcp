# Create PVC with Terraform Modules

This repository demonstrates how to create a Persistent Volume Claim (PVC) using Terraform modules in a GCP environment.

## Prerequisites

- Terraform installed on your local machine.
- Access to a GCP project with necessary permissions.
- Configured `gcloud` CLI for authentication.

## Usage

1. Clone this repository:
    ```bash
    git clone <repository-url>
    cd environments/vpc-practice
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Review and customize variables in `variables.tf` or provide a `terraform.tfvars` file.

4. Apply the configuration:
    ```bash
    terraform apply
    ```

5. Confirm the resources are created successfully.

## Cleanup

To destroy the created resources:
```bash
terraform destroy
```

## Notes

- Ensure proper IAM roles are assigned to the service account used.
- Review the Terraform state file for sensitive information.
