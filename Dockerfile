FROM jenkins/jenkins:2.332.2-jdk11
LABEL org.opencontainers.image.source="https://github.com/troublemaker-dev/docker-jenkins" \
      org.opencontainers.image.authors="Ken Rachynski <chief@troublemaker.dev>" \
      org.opencontainers.image.vendor="Troublemaker Development" \
      org.opencontainers.image.url="https://ghcr.io/troublemaker-dev/jenkins" \
      org.opencontainers.image.title="Custom Jenkins Docker image"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# hadolint ignore=DL3059,SC2086
RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
# hadolint ignore=DL3059,SC2086
RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
ENV CASC_JENKINS_CONFIG /config/jenkins.yaml
COPY jenkins.yaml /config/jenkins.yaml
