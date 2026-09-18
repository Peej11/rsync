FROM alpine:3.24.2@sha256:3cf95fe0816180395592b8373f3ec60663f076127617bbacb4eacf9667afe2e9

# renovate: datasource=repology depName=alpine_3_24/rsync versioning=loose
ARG RSYNC_VERSION="3.5.0-r0"

# Fuzzy match (=~) keeps -rN package rebuilds from breaking the build; Renovate
# bumps RSYNC_VERSION when Alpine ships a new upstream rsync version.
RUN apk add --no-cache "rsync=~${RSYNC_VERSION}"

CMD ["rsync", "--version"]
