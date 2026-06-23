FROM alpine:3.23.5@sha256:fd791d74b68913cbb027c6546007b3f0d3bc45125f797758156952bc2d6daf40

# renovate: datasource=repology depName=alpine_3_23/rsync versioning=loose
ARG RSYNC_VERSION="3.4.3"

# Fuzzy match (=~) keeps -rN package rebuilds from breaking the build; Renovate
# bumps RSYNC_VERSION when Alpine ships a new upstream rsync version.
RUN apk add --no-cache "rsync=~${RSYNC_VERSION}"

CMD ["rsync", "--version"]
