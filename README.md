# beets-docker
Opinionated Beets in Docker form

This Docker image extends the [linuxserver/beets](https://hub.docker.com/r/linuxserver/beets) base image with additional plugins:
- **ytimport**: Download audio from YouTube and import it into your library
- **xtractor**: Extract low and high level musical information from your songs using Essentia

## Building the Image

```bash
docker build -t beets-docker .
```

## Usage

Run the container using docker-compose:

```yaml
---
services:
  beets:
    image: beets-docker:latest
    container_name: beets
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/beets/config:/config
      - /path/to/music/library:/music
      - /path/to/ingest:/downloads
    ports:
      - 8337:8337
    restart: unless-stopped
```

Or using docker run:

```bash
docker run -d \
  --name=beets \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 8337:8337 \
  -v /path/to/beets/config:/config \
  -v /path/to/music/library:/music \
  -v /path/to/ingest:/downloads \
  --restart unless-stopped \
  beets-docker:latest
```

## Plugin Configuration

To enable the plugins, add them to your beets configuration file (`/config/config.yaml`):

```yaml
plugins:
  - ytimport
  - xtractor
```

### ytimport Configuration

For detailed ytimport configuration, see the [beets-ytimport documentation](https://github.com/mgoltzsche/beets-ytimport).

Example configuration:

```yaml
ytimport:
  directory: /downloads/youtube
  import: true
  format: bestaudio/best
```

### xtractor Configuration

For detailed xtractor configuration, see the [beets-xtractor documentation](https://github.com/adamjakab/BeetsPluginXtractor).

Note: The xtractor plugin requires the Essentia extractor binary and SVM models to be installed separately.

## Installed Packages

- beets
- beets-ytimport
- ytmusicapi
- yt-dlp
- beets-xtractor
