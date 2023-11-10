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

variable "project_id" {
  type        = string
  description = "GCP project id."
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace where resources are deployed."
}

variable "service_account" {
  type        = string
  description = "Google Cloud IAM service account for authenticating with GCP services."
  default     = "ray-on-gke-system-account"
}

variable "region" {
  type        = string
  description = "GCP project region or zone"
  default     = "us-central1"
}

variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
  default     = "ml-cluster"
}

variable "enable_autopilot" {
  type        = bool
  description = "Set to true to enable GKE Autopilot clusters"
  default     = false
}

variable "enable_tpu" {
  type        = bool
  description = "Set to true to create TPU node pool"
  default     = false
}

variable "provision-a-gke-cluster" {
  type = bool
  description = "Provision a GKE cluster or use an existing one."
  default = true
}

variable "custom_gpu_selection" {
  type = object({
      machine = string
      gpu = string
      count = number
      disk = string
  })
  description = "Use a custom gpu/cpu combination."
  default = {
      machine = "g2-standard-16"
      gpu = "nvidia-l4"
      count = 1
      disk = "pd-balanced"
  }
}

variable "gpu_machine_cfg" {
  type = string
  description = "Use a gpu/cpu combo, see locals.tf for details."
  default = "nvidia_l4_x1"
}

variable "gpu_locations" {
  type = list
  description = "List of zones to run gpu nodes"
  default = null
}
