locals {
  region = "asia-northeast1"
  zone   = "asia-northeast1-b"
}

provider "google" {
  region = local.region
  zone   = local.zone
}

provider "google-beta" {
  region = local.region
  zone   = local.zone
}
