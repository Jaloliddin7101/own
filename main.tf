terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"  # Check for the latest version
    }
  }

  required_version = ">= 0.12"
}

provider "google" {
  credentials = file("/Users/jaloliddin/Downloads/key.json")
  project     = "natural-iridium-439511-m3"
  region      = "us-central1"
}

resource "google_bigquery_dataset" "jaloliddin" {
  dataset_id = "jaloliddin"
  location   = "US"
}

resource "google_bigquery_table" "table_1" {
  table_id   = "table1"
  dataset_id = google_bigquery_dataset.jaloliddin.dataset_id

  schema = jsonencode([
    {
      "name" = "id"            # Change column name here
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
      "name" = "description"            # New column
      "type" = "STRING"
      "mode" = "NULLABLE"
    }
  ])
}
