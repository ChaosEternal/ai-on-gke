# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

data "google_client_config" "provider" {}

data "google_container_cluster" "ml_cluster" {
  name       = var.gke_cluster_name
  location   = var.region
}

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


module "gke_cluster" {
  source           = "../../gke-platform/modules/gke"
  project_id       = var.project_id
  count            = var.provision-a-gke-cluster ? 1 : 0
  region           = var.region
  cluster_name     = var.gke_cluster_name
  enable_autopilot = var.enable_autopilot
  enable_tpu       = var.enable_tpu
}

module "kubernetes" {
  source = "./modules/kubernetes"

  namespace = var.namespace
}

module "service_accounts" {
  source = "./modules/service_accounts"

  depends_on      = [module.kubernetes]
  project_id      = var.project_id
  namespace       = var.namespace
  service_account = var.service_account
}

module "kuberay" {
  source = "./modules/kuberay"

  depends_on       = [module.kubernetes]
  namespace        = var.namespace
  enable_tpu       = var.enable_tpu
  enable_autopilot = var.enable_autopilot
}

module "prometheus" {
  source = "./modules/prometheus"

  depends_on = [module.kuberay]
  project_id = var.project_id
  namespace  = var.namespace
}
