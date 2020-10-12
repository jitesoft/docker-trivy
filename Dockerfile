# syntax = docker/dockerfile:experimental
FROM jitesoft/alpine:latest
ARG VERSION
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/trivy" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/trivy/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/trivy" \
      com.jitesoft.app.trivy.version="${VERSION}"


ARG TARGETARCH
RUN --mount=type=bind,source=./binaries,target=/tmp/bin \
    cp /tmp/bin/trivy-${TARGETARCH} /usr/local/bin/trivy \
 && cp /tmp/bin/entrypoint /usr/local/bin/ \
 && mkdir -p /contrib \
 && cp /tmp/bin/gitlab.tpl /contrib/gitlab.tpl \
 && apk add --no-cache ca-certificates git rpm \
 && chmod +x /usr/local/bin/trivy \
 && chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
CMD ["--help"]
