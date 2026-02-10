FROM lscr.io/linuxserver/beets:latest

# Install ytimport plugin with its dependencies
RUN \
  echo "**** install plugins ****" && \
  pip install --no-cache-dir \
    beets-ytimport==1.5.0 \
    ytmusicapi==1.11.5 \
    yt-dlp==2026.2.4

# Labels
LABEL maintainer="hungsu"
LABEL description="Beets with ytimport plugin"
