terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5" 
    }
  }

  required_version = ">= 0.12"
}

provider "google" {
  credentials = file("/Users/jaloliddin/Downloads/key.json")
  project     = var.project
  region      = var.region
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
  location   = "US"
}

resource "google_bigquery_table" "table_1" {
  table_id   = "table1"
  dataset_id = google_bigquery_dataset.dataset.dataset_id

  schema = jsonencode([
    {
      "name" = "id"
      "type" = "INTEGER"
      "mode" = "REQUIRED"
    },
    {
      "name" = "name"
      "type" = "STRING"
      "mode" = "NULLABLE"
    },
    {
      "name" = "created_at"
      "type" = "TIMESTAMP"
      "mode" = "NULLABLE"
    },
    {
      "name" = "description"
      "type" = "STRING"
      "mode" = "NULLABLE"
    }
  ])
}
