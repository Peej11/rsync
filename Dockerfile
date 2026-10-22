FROM alpine:3.24.3@sha256:1b7232cda4ca3dc20b5d1247bdc9bfb631f2661d15d323bdd6fccc035ed1a9e7

# renovate: datasource=repology depName=alpine_3_24/rsync versioning=loose
ARG RSYNC_VERSION="3.5.0-r0"

# Fuzzy match (=~) keeps -rN package rebuilds from breaking the build; Renovate
# bumps RSYNC_VERSION when Alpine ships a new upstream rsync version.
RUN apk add --no-cache "rsync=~${RSYNC_VERSION}"

CMD ["rsync", "--version"]
