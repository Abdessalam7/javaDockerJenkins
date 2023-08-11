# Use a base image with Java and Docker installed
FROM jenkins/agent

# Switch to root user to install software
USER root

# Install Maven
ENV MAVEN_VERSION 3.8.3
RUN cd /usr/local && \
    wget https://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar -xzvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION maven

# Set Maven environment variables
ENV M2_HOME /usr/local/maven
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

# Switch back to the Jenkins user
USER jenkins
