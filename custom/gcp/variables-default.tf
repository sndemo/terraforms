#
# Variables Configuration
#

variable "customer-name" {
}

variable "gcp_key_file" {
}

variable "gcp_instance-type" {
  default = "n1-standard-4"
  type    = "string"
}

variable "gcp_desired_capacity" {
  default = "2"
  type    = "string"
}

variable "gcp_max_size" {
  default = "3"
  type    = "string"
}

variable "gcp_min_size" {
  default = "1"
  type    = "string"
}

variable "gcp_cluster-name" {
  default = "kubernetes-cluster"
  type    = "string"
}

variable "gcp_project" {
  default = "softwarization-net"
  type    = "string"
}

variable "gcp_region" {
  default = "us-west1"
  type    = "string"
}

variable "gcp_zone" {
  default = "us-west1-a"
  type    = "string"
}

variable "gcp_add_zone" {
  default = "us-west1-b"
  type    = "string"
}

