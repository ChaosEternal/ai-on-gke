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
  name       = var.cluster_name
  location   = var.region
}

module "gke" {
  source = "./modules/gke"

  project_id       = var.project_id
  region           = var.region
  cluster_name     = var.cluster_name
  enable_autopilot = var.enable_autopilot
  enable_tpu       = var.enable_tpu
}

