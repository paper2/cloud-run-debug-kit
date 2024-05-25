resource "google_compute_instance" "cloud_run_debugger" {
  name         = "cloud-run-debugger"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update && apt-get install -y netcat
  EOT

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["cloud-run-debugger"]
}

resource "google_compute_firewall" "default_allow_cloud_run_debugger" {
  name    = "default-allow-cloud-run-debugger"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["1234"]
  }

  target_tags   = ["cloud-run-debugger"]
  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}
