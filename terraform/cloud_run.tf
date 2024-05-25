resource "google_cloud_run_v2_service" "cloud_run_debugger" {
  provider = google-beta
  location = local.region
  name     = "cloud-run-debugger"
  ingress  = "INGRESS_TRAFFIC_ALL"
  template {
    scaling {
      # Prevent from zero scailing.
      min_instance_count = 1
      max_instance_count = 1
    }
    containers {
      name = "hello-1"
      ports {
        container_port = 8080
      }
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
    containers {
      name  = "cloud-run-debugger"
      image = "docker.io/paper2/cloud-run-debugger:latest"
      env {
        name  = "PUBLIC_IP"
        value = google_compute_instance.cloud_run_debugger.network_interface.0.access_config.0.nat_ip
      }
      resources {
        # Ensure the debugger container always has CPU resources.
        cpu_idle = false
      }
    }
  }
}
