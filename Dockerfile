FROM jenkins:1.625.3

USER root

# install official plugins
ENV JENKINS_UC http://jenkins-updates.cloudbees.com
COPY workflow-version.txt plugins.txt /tmp/files/
RUN sed -i "s/@VERSION@/`cat /tmp/files/workflow-version.txt`/g" /tmp/files/plugins.txt
USER jenkins
RUN /usr/local/bin/plugins.sh /tmp/files/plugins.txt

# install experimental ones
RUN curl -sSL -f http://mirrors.jenkins-ci.org/plugins/github-pullrequest/latest/github-pullrequest.hpi -o /usr/share/jenkins/ref/plugins/github-pullrequest.jpi && unzip -qqt /usr/share/jenkins/ref/plugins/github-pullrequest.jpi

# This will get copied to /var/jenkins_home in the container
# by the startup script
ADD jenkins_home /usr/share/jenkins/ref

USER root
RUN chown -R jenkins.jenkins /usr/share/jenkins/ref
USER jenkins

EXPOSE 8080
