# Jenkins server for Lab 07, running inside Docker Desktop on Windows.
# It adds the Docker CLI so pipeline steps ("docker build", "docker run")
# can talk to the host's Docker engine through the mounted /var/run/docker.sock.
# Educational use only: Docker socket access gives Jenkins full control of Docker.
FROM jenkins/jenkins:lts-jdk21

USER root
COPY --from=docker:cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker:cli /usr/local/libexec/docker/cli-plugins /usr/local/libexec/docker/cli-plugins
USER jenkins

# Plugins required by the lab (Pipeline + Git) plus stage views for screenshots.
RUN jenkins-plugin-cli --plugins workflow-aggregator git pipeline-stage-view pipeline-graph-view
