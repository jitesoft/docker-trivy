# syntax = docker/dockerfile:experimental
FROM jitesoft/alpine:3.14
ARG VERSION
ARG BUILD_TIME

LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/trivy" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/trivy/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/trivy" \
      com.jitesoft.app.trivy.version="${VERSION}" \
      # Open container labels
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_TIME}" \
      org.opencontainers.image.description="Scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues." \
      org.opencontainers.image.vendor="Jitesoft" \
      org.opencontainers.image.source="https://gitlab.com/jitesoft/dockerfiles/trivy" \
      # Artifact hub annotations
      io.artifacthub.package.alternative-locations="oci://registry.gitlab.com/jitesoft/dockerfiles/trivy,oci://index.docker.io/jitesoft/trivy,oci://ghcr.io/jitesoft/trivy" \
      io.artifacthub.package.readme-url="https://gitlab.com/jitesoft/dockerfiles/trivy/-/raw/master/README.md" \
      io.artifacthub.package.logo-url="https://jitesoft.com/favicon-96x96.png"

ARG TARGETARCH
RUN --mount=type=bind,source=./binaries,target=/tmp/bin \
    cp /tmp/bin/trivy-${TARGETARCH} /usr/local/bin/trivy \
 && cp /tmp/bin/entrypoint /usr/local/bin/ \
 && mkdir -p /contrib \
 && cp /tmp/bin/contrib/*.tpl /contrib/ \
 && apk add --no-cache ca-certificates git rpm \
 && chmod +x /usr/local/bin/trivy \
 && chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
CMD ["--help"]
