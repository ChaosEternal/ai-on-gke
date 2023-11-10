locals {
  machine_configs = {
    nvidia_l4_x1 = {
      machine = "g2-standard-16"
      gpu = "nvidia-l4"
      count = 1
      disk = "pd-balanced"
    }
    nvidia_l4_x2 = {
      machine = "g2-standard-24"
      gpu = "nvidia-l4"
      count = 2
      disk = "pd-balanced"
    }
    nvidia_l4_x4 = {
      machine = "g2-standard-48"
      gpu = "nvidia-l4"
      count = 4
      disk = "pd-balanced"
    }
    nvidia_l4_x8 = {
      machine = "g2-standard-96"
      gpu = "nvidia-l4"
      count = 8
      disk = "pd-balanced"
    }
    nvidia_t4_x1 = {
      machine = "n1-standard-8"
      gpu = "nvidia-tesla-t4"
      count = 1
      disk = "pd-standard"
    }
    nvidia_t4_x2 = {
      machine = "n1-standard-16"
      gpu = "nvidia-tesla-t4"
      count = 2
      disk = "pd-standard"
    }
    nvidia_t4_x4 = {
      machine = "n1-standard-32"
      gpu = "nvidia-tesla-t4"
      count = 4
      disk = "pd-standard"
    }
    custom_gpu = {
      machine = var.custom_gpu_selection.machine
      gpu = var.custom_gpu_selection.gpu
      count = var.custom_gpu_selection.count
      disk = var.custom_gpu_selection.disk
    }
  }
}
