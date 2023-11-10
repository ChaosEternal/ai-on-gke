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
  description = "GCP project id"
  default     = "<your project>"
}

variable "region" {
  type        = string
  description = "GCP project region or zone"
  default     = "us-central1"
}

variable "cluster_name" {
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

variable "cpu_node_machine" {
  type = string
  description = "The machine used for cpu nodes"
  default = "n1-standard-16"
}

variable "gpu_type" {
  type        = string
  description = "The gpu type to use."
  default     = "nvidia-l4"
}

variable "gpu_count" {
  type        = number
  description = "The number of GPUs per node."
  default     = 2
}

variable "gpu_node_machine" {
  type = string
  description = "The machine type of gpu nodes"
  default = "g2-standard-16"
}

variable "gpu_node_disk" {
  type = string
  description = "The disk type of gpu nodes"
  default = "pd-balanced"
}

variable "gpu_node_disk_size" {
  type = string
  description = "The disk size of gpu nodes"
  default = "100"
}

variable "gpu_locations" {
  type = list
  description = "List of zones to run gpu nodes"
  default = null
}
