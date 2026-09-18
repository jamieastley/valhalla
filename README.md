# Valheim

A modded Valheim server.

Game data such as world saves, mod configs, server data and save backups are all stored in their own
external Docker volumes and should be created before running `docker compose up`.

## World Seed

The current world seed for this playthrough is `Y0IRrfwvzK`.

## Getting started

- create `adminlist.txt`, populate with [steamID64](https://steamid.io/) _on separate lines_ and
  place file in root of `saves` volume.
- ensure `init-permissions` container has been executed prior to (re)starting server container

## Required environment variables

The compose services expect the following environment variables to be set (e.g. in a `.env` file or
exported in your shell):

| Variable            | Required | Description                                                                                                               |
|---------------------|----------|---------------------------------------------------------------------------------------------------------------------------|
| `CF_API_EMAIL`      | Yes      | Cloudflare account email address used for the ACME DNS challenge.                                                         |
| `CF_DOMAIN`         | Yes      | Base domain managed by Cloudflare. Routes are created as subdomains of this domain (e.g. `huginn.valhalla.${CF_DOMAIN}`). |
| `ACME_CA_SERVER`    | No       | Let's Encrypt CA server URL. Defaults to `https://acme-v02.api.letsencrypt.org/directory`.                                |
| `ACME_STORAGE`      | No       | Path inside the Traefik container where the ACME certificate store is kept. Defaults to `/certs/acme.json`.               |
| `TRAEFIK_SUBDOMAIN` | No       | Subdomain used for the Traefik dashboard. Defaults to `traefik.valhalla`.                                                 |

### Required secret files

Create the following files under `./secrets/` before running `docker compose up`:

| File                         | Description                                                                                                                                              |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `./secrets/ts_authkey`       | Tailscale [auth key](https://tailscale.com/kb/1085/auth-keys) used to join the tailnet.                                                                  |
| `./secrets/cf_dns_api_token` | Cloudflare [DNS API token](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) with `Zone:DNS:Edit` permission for the domain. |

## Mods

Import `7TNNDJ` as a profile code within Gale.
