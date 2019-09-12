#
# Provider Configuration
# 

provider "google" {
  credentials = "${file("${var.gcp_key_file}")}"
  region = "${var.gcp_region}"
  zone    = "${var.gcp_zone}"
}

terraform {
  backend "s3" {
  }
}

