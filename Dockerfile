FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

# renovate: datasource=repology depName=alpine_3_23/rsync versioning=loose
ARG RSYNC_VERSION="3.4.3"

# Fuzzy match (=~) keeps -rN package rebuilds from breaking the build; Renovate
# bumps RSYNC_VERSION when Alpine ships a new upstream rsync version.
RUN apk add --no-cache "rsync=~${RSYNC_VERSION}"

CMD ["rsync", "--version"]
