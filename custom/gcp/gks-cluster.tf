#
# Kubernetes Cluster Resources
#  * EKS Cluster
#

data "google_container_engine_versions" "uswest1a" {
  location           = "us-west1-a"
  project = "softwarization-net"
}

resource "google_container_cluster" "kubernetes-cluster" {
  name               = "${var.customer-name}-${var.gcp_cluster-name}"
  project            = "${var.gcp_project}"
  location           = "${var.gcp_zone}"
  remove_default_node_pool = true
  initial_node_count = 1
  
  network            = "${google_compute_network.gcp_vpc.name}"
  subnetwork         = "${google_compute_subnetwork.gcp_subnet.name}"

  enable_legacy_abac = true
  
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = true
    }
  }
  
  node_locations = [
    "${var.gcp_add_zone}",
  ]
}
