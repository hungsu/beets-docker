FROM lscr.io/linuxserver/beets:latest

# Install ytimport plugin and its dependencies
RUN \
  echo "**** install ytimport plugin ****" && \
  pip install --no-cache-dir \
    beets-ytimport \
    ytmusicapi \
    yt-dlp

# Install xtractor plugin
RUN \
  echo "**** install xtractor plugin ****" && \
  pip install --no-cache-dir \
    beets-xtractor

# Labels
LABEL maintainer="hungsu"
LABEL description="Beets with ytimport and xtractor plugins"
