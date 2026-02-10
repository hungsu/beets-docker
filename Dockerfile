FROM lscr.io/linuxserver/beets:latest

# Install ytimport and xtractor plugins with their dependencies
RUN \
  echo "**** install plugins ****" && \
  pip install --no-cache-dir \
    beets-ytimport==1.12.1 \
    ytmusicapi==1.11.5 \
    yt-dlp==2026.2.4 \
    beets-xtractor==0.4.2

# Labels
LABEL maintainer="hungsu"
LABEL description="Beets with ytimport and xtractor plugins"
