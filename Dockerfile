FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

# renovate: datasource=repology depName=alpine_3_24/rsync versioning=loose
ARG RSYNC_VERSION="3.5.0-r0"

# Fuzzy match (=~) keeps -rN package rebuilds from breaking the build; Renovate
# bumps RSYNC_VERSION when Alpine ships a new upstream rsync version.
RUN apk add --no-cache "rsync=~${RSYNC_VERSION}"

CMD ["rsync", "--version"]
