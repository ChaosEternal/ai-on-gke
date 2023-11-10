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


module "gke_autopilot" {
  source = "../gke_autopilot"

  project_id       = var.project_id
  region           = var.region
  cluster_name     = var.cluster_name
  enable_autopilot = var.enable_autopilot
}


module "gke_standard" {
  source = "../gke_standard"

  project_id       = var.project_id
  region           = var.region
  cluster_name     = var.cluster_name
  enable_autopilot = var.enable_autopilot
  enable_tpu       = var.enable_tpu

  gpu_locations    = var.gpu_locations
  
  cpu_node_machine = var.cpu_node_machine
  gpu_type         = var.gpu_type
  gpu_count        = var.gpu_count
  gpu_node_machine = var.gpu_node_machine
  gpu_node_disk    = var.gpu_node_disk
  gpu_node_disk_size = var.gpu_node_disk_size
}
