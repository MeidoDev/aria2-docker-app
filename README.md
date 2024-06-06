# aria2-docker-app

A simple Docker image combining [aria2](https://aria2.github.io/), [AriaNg](https://github.com/mayswind/AriaNg) and [nginx](https://nginx.org) into a Download app with focus on BitTorrent.

Compared to other, more sophisticated Docker images you can find on the internet, this one is focusing on a small footprint and ease of installation / use.

## Usage instructions

* If you're deploying the app in a way that allows accessing it from other computers in your network, you should consider putting a reverse proxy like HAProxy or Traefik in front of the app, to enable access control and TLS.

* When configuring the web UI, choose HTTP(S) instead of JSONRPC, otherwise the UI won't be able to connect to aria2.

### Ports

| Port | Description |
| - | - |
| 80 _(tcp)_ | Used for the web UI and the aria2 API. |
| 6868 | Inbound BitTorrent port. Should be reachable from the internet to improve BT speeds. |

### Volumes

| Path | Description |
| - | - |
| `/downloads` | The directory into which downloads will be saved. |
| `/aria-run` | Contains the DHT database and session data. |

### ENV Variables

| ENV | Description |
| - | - |
| `UPLOAD_LIMIT` | Global upload limit. _(e.g. "500K", "10M")_ |
| `DOWNLOAD_LIMIT` | Global download limit. _(e.g. "500K", "10M")_ |
| `SEED_RATIO` | The seed after which transfers are considered completed. _(e.g. "1.5")_ |
