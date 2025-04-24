module "gcs_buckets" {
  source     = "terraform-google-modules/cloud-storage/google"
  version    = "~> 10.0"
  project_id = var.gcp_project_id
  location   = var.gcp_region
  names      = ["first"]
  prefix     = var.bucket_prefix
  # force_destroy = false # Bỏ comment để bật

  website = {
    enabled          = true
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

# Gán IAM permissions cho bucket
resource "google_storage_bucket_iam_binding" "bucket_iam" {
  bucket     = module.gcs_buckets.buckets[0].name
  role       = "roles/storage.objectViewer"
  members    = ["allUsers"]
  depends_on = [module.gcs_buckets]
}

# Create a text object in Cloud Storage
resource "google_storage_bucket_object" "static" {
  name         = "static-web/article-details.html"   # Tên object trên GCS
  source       = "./static-web/article-details.html" # Đường dẫn file cục bộ
  content_type = "text/html"                         # Đúng loại MIME cho HTML
  bucket       = module.gcs_buckets.buckets[0].name  # Sử dụng bucket từ module
  depends_on   = [module.gcs_buckets]
}