variable "credentials" {
  description = "Service account credentials"
  default     = "<Path to your Service Account json file>"
}

variable "project" {
  description = "Project"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "gcs_bucket_name" {
  description = "Storage bucket name"
  default     = "the-look-dataset"
}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"
}

variable "bq_dataset_name" {
  description = "BigQuery dataset name"
  default     = "customer_data"
}