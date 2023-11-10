provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host  = data.google_container_cluster.ml_cluster.endpoint
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.ml_cluster.master_auth[0].cluster_ca_certificate
  )
}

provider "kubectl" {
  host  = data.google_container_cluster.ml_cluster.endpoint
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.ml_cluster.master_auth[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    ##config_path = pathexpand("~/.kube/config")
    host  = data.google_container_cluster.ml_cluster.endpoint
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.ml_cluster.master_auth[0].cluster_ca_certificate
    )
  }
}
