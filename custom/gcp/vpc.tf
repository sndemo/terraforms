#
# VPC Resources
#  * VPC
#  * Subnets
#  * Route Table
#

resource "google_compute_route" "gcp_route" {
  name        = "${var.customer-name}-network-route"
  project     = "${var.gcp_project}"
  dest_range  = "0.0.0.0/0"
  network     = "${google_compute_network.gcp_vpc.name}"
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_network" "gcp_vpc" {
  name                    = "${var.customer-name}-network"
  project                 = "${var.gcp_project}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcp_subnet" {
  name                     = "${var.customer-name}-subnetwork"
  region                  = "${var.gcp_region}"
  project                 = "${var.gcp_project}"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "${google_compute_network.gcp_vpc.name}"
  private_ip_google_access = true
}