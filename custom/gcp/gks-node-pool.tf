resource "google_container_node_pool" "kubernetes-cluster-node-pool" {
  name       = "${var.customer-name}-${var.gcp_cluster-name}-nodes"
  project    = "${var.gcp_project}"
  cluster    = "${google_container_cluster.kubernetes-cluster.name}"
  location   = "${var.gcp_zone}"
  node_count = "${var.gcp_min_size}"

  node_config {
    machine_type = "${var.gcp_instance-type}"
    
    oauth_scopes = [
      "compute-rw",
      "storage-full",
      "pubsub",
      "logging-write",
      "service-control",
      "service-management",
      "monitoring",
    ]

    labels {
      for = "ReferenceArchitecture"
    }

    tags = ["softwarization", "${var.customer-name}"]
  }

  autoscaling {
    min_node_count = "${var.gcp_desired_capacity}"
    max_node_count = "${var.gcp_max_size}"
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}