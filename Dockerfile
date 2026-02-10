FROM lscr.io/linuxserver/beets:latest

# Install ytimport plugin with its dependencies
RUN \
  echo "**** install plugins ****" && \
  pip install --no-cache-dir \
    beets-ytimport==1.5.0 \
    ytmusicapi \
    yt-dlp

# Labels
LABEL maintainer="hungsu"
LABEL description="Beets with ytimport plugin"
