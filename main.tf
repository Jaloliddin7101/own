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
  project = "natural-iridium-439511-m3"   
  region  = "us-central1"  
  credentials = file("/tmp/account.json")
}



resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = "my_dataset"  
  location   = "US"           
}

resource "google_bigquery_table" "my_table" {
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  table_id   = "my_table" 


  schema = <<EOF
[
  {
    "name": "id",             
    "type": "STRING",         
    "mode": "NULLABLE" 
  }
]
EOF

}
