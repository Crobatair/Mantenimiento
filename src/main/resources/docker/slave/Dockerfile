FROM openjdk:8-jdk
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG password=secret
ENV JENKINS_HOME=/home/jenkins
RUN apt-get update && \
	apt-get install -y git curl openssh-server && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /var/run/sshd && \
	groupadd -g ${gid} ${group} && \
	useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -p secret -m -s /bin/bash ${user}

ARG MAVEN_VERSION=3.5.3
ARG USER_HOME_DIR="/root"
ARG SHA=b52956373fab1dd4277926507ab189fb797b3bc51a2a267a193c931fffad8408
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref && \
     curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
     echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - && \
     tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
     rm -f /tmp/apache-maven.tar.gz && \
     ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
#Variables de entorno para configurar maven a utilizar dentro de Jenkins
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV MAVEN /usr/bin/mvn
