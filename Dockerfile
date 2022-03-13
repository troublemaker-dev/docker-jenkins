FROM jenkins/jenkins:2.332.1-jdk11
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# hadolint ignore=DL3059,SC2086
RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
# hadolint ignore=DL3059,SC2086
RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
ENV CASC_JENKINS_CONFIG /config/jenkins.yaml
COPY jenkins.yaml /config/jenkins.yaml
