# rsync

Minimal [rsync](https://rsync.samba.org/) image based on Alpine, published to `ghcr.io/peej11/rsync`.

## Image

- Base: Alpine (multi-arch `linux/amd64` + `linux/arm64`), pinned by digest and kept current by Renovate.
- Contains only the `rsync` apk package — nothing else.
- No `latest` or other rolling tag.

### Tags

Every push to `main` publishes the same image under three tags:

| Tag | Example | Purpose |
| --- | --- | --- |
| `<rsync>` | `3.4.3` | rsync version — the tag to pin downstream. Re-pushed on rebuilds (e.g. an Alpine bump), so consume it by digest (`@sha256:…`). |
| `<rsync>-alpine<alpine>` | `3.4.3-alpine3.24.1` | rsync version + Alpine base, for when the base needs to be distinguished. Also re-pushable; pin by digest. |
| `<timestamp>-sha-<sha>` | `20260623-181500-sha-abc1234` | Unique per build (UTC build time + commit). Never reused — use for provenance or rollback. |

Pushing a `v*` git tag instead publishes a single semver tag (e.g. `v1.2.3` → `1.2.3`).

## Automatic updates

[Renovate](https://docs.renovatebot.com/) keeps the image current and
auto-merges the following (see [.renovaterc.json5](.renovaterc.json5)):

- **Alpine base image** — tag and digest, via the native Docker manager.
- **rsync apk package** — `ARG RSYNC_VERSION` in the [Dockerfile](Dockerfile)
  is tracked through the Repology datasource (`alpine_3_23/rsync`). It is
  applied as a fuzzy apk match (`rsync=~<version>`) so `-rN` package rebuilds
  never break the build, while upstream version bumps still raise a PR.
