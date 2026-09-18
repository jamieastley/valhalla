terraform {
  cloud {

    organization = "jamieastley"

    workspaces {
      name = "valhalla"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.25.0"
    }
  }
}

provider "cloudflare" {}

resource "cloudflare_dns_record" "traefik" {
  name    = "traefik.valhalla"
  ttl     = 60
  type    = "A"
  zone_id = var.zone_id
  proxied = false
  content = var.record_content
  comment = "Traefik dashboard and API"
}

resource "cloudflare_dns_record" "valheim" {
  name    = "valhalla"
  ttl     = 60
  type    = "A"
  zone_id = var.zone_id
  proxied = false
  content = var.record_content
  comment = "Self-hosted Valheim server"
}

resource "cloudflare_dns_record" "huginn" {
  name    = "huginn.valhalla"
  ttl     = 60
  type    = "A"
  zone_id = var.zone_id
  proxied = false
  content = var.record_content
  comment = "Self-hosted Valheim server internal tools"
}
